package com.situ.mall.controller.front;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.OrderItem;
import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.Shipping;
import com.situ.mall.pojo.User;
import com.situ.mall.service.IProductService;
import com.situ.mall.service.front.IOrderService;
import com.situ.mall.service.front.IShippingService;
import com.situ.mall.vo.BuyCartVO;
import com.situ.mall.vo.CartItemVO;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

@Controller
@RequestMapping("/order")
public class FrontOrderController {
	//防止刷新重提交订单，构造一个静态变量来接受订单编号 order_no
	private static Long orderNo;
	@Autowired
	private IShippingService shippingService;
	@Autowired
	private IOrderService orderService;
	@Autowired
	private IProductService productService;
	
	
	@RequestMapping("/preparedorede")
	private String preparedorder(Model model,HttpServletRequest request){
		HttpSession httpSession = request.getSession(false);
		//1.获得User对象从Session中
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		//2.通过Use得到收获地址
		List<Shipping> shippings =  shippingService.findByUserId(user.getId());
		model.addAttribute("shippings", shippings);
		System.out.println("------------"+shippings);
		
		//3.从Cookie中得到购物车
		/*BuyCartVO buyCart = getBuCartFromCooki();*/
		
		//从cookie获取buyCartVO
		//springmvc
				ObjectMapper objectMapper = new ObjectMapper();
				//只有对象里面不是null的才转换
				objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
				
				BuyCartVO buyCartVO = null;
				Cookie[] cookies = request.getCookies();
				//1.如果cookie有这个购物车对象，那就从cookie里面取出这个购物车对象
				if (null != cookies && cookies.length > 0) {
					for (Cookie cookie : cookies) {
						if ("buy_cart_cookie".equals(cookie.getName())) {
							//之前已经有购物车
							//"{\"items\":[{\"product\":{\"id\":45},\"amount\":1}],\"productId\":45}"
							//存在buy_cart_cookie
							String value = cookie.getValue();
								try {
									buyCartVO = objectMapper.readValue(value, BuyCartVO.class);
								} catch (JsonParseException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (JsonMappingException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (IOException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
							
						}
					}
				}
		//将购物车装满Product，而不是只是装Product的id
		List<CartItemVO> items = buyCartVO.getItems();
		for (CartItemVO item : items) {
			Product product = productService.findById(item.getProduct().getId());
			 item.getProduct().setName(product.getName());
			 item.getProduct().setPrice(product.getPrice());
			 item.getProduct().setMainImage(product.getMainImage());
		}
		model.addAttribute("buyCartVO",buyCartVO);
		return "order";
	}
	@RequestMapping("/addOrder")
	private String addOrder(Order order,HttpServletRequest request, Model model,HttpServletResponse response){
		System.out.println(order);
		//1.获得User对象从Session中
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		orderNo = System.currentTimeMillis();//生成订单号
		order.setOrderNo(orderNo);
		System.out.println(order);
		order.setUserId(user.getId());
		//将订单插入数据库
		boolean b = orderService.add(order);
		ObjectMapper objectMapper = new ObjectMapper();
		//只有对象中不是空的才转换
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		//从cookie中得到购物车
		BuyCartVO buyCartVO = null;
		Cookie[] cookies = request.getCookies();
		//判断cookie是否为空
				if (null != cookies && cookies.length != 0) {
					for (Cookie cookie : cookies) {
						if ("buy_cart_cookie".equals(cookie.getName())) {
							String value = cookie.getValue();
							try {
								buyCartVO = objectMapper.readValue(value, BuyCartVO.class);
							} catch (JsonParseException e) {
								e.printStackTrace();
							} catch (JsonMappingException e) {
								e.printStackTrace();
							} catch (IOException e) {
								e.printStackTrace();
							}
						}
					}
				}
				
		if (null != buyCartVO){
			List<CartItemVO> cartItems = buyCartVO.getItems();
			for (CartItemVO cartItemVO : cartItems) {
				OrderItem orderItem = new OrderItem();
				Product product = productService.findById(cartItemVO.getProduct().getId());
				orderItem.setUserId(user.getId());
				orderItem.setOrderNo(orderNo);
				orderItem.setProductId(product.getId());
				orderItem.setProductName(product.getName());
				orderItem.setProductImage(product.getMainImage());
				orderItem.setCurrentUnitPrice(BigDecimal.valueOf(product.getPrice()));
				orderItem.setQuantity(cartItemVO.getAmount());
				orderItem.setTotalPrice(BigDecimal.valueOf(product.getPrice() * cartItemVO.getAmount()));
				orderService.addOrderItem(orderItem);
			}
		}
		
		//将订单加入到数据库中后，清除cookie
		Cookie cookie = new Cookie("buy_cart_cookie",null);
		cookie.setPath("/");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		
		//防止刷新订单，重定向到pay页面
		return "redirect:pay.shtml";
	}
	
	//pay页面
	@RequestMapping("/pay")
	private String pay(Model model){
		Double totalPrice = 0.00;
		List<OrderItem> list = orderService.findByOrder(orderNo);
		for (OrderItem orderItem : list) {
			totalPrice += orderItem.getTotalPrice().doubleValue();
		}
		model.addAttribute("orderNo",orderNo);
		model.addAttribute("totalPrice",totalPrice);
		return "pay";
	}
	

	/**
	 * @return the orderNo
	 */
	public static Long getOrderNo() {
		return orderNo;
	}

	/**
	 * @param orderNo the orderNo to set
	 */
	public static void setOrderNo(Long orderNo) {
		FrontOrderController.orderNo = orderNo;
	}
}
