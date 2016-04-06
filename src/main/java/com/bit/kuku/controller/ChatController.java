package com.bit.kuku.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.kuku.dao.MongoDao;
import com.bit.kuku.service.ChatroomService;
import com.bit.kuku.vo.ChatVo;
import com.bit.kuku.vo.ChatroomVo;
import com.bit.kuku.vo.ListenerVo;
import com.bit.kuku.vo.TalkerVo;

@Controller
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	private ChatroomService chatroomService;

	@Autowired
	MongoDao mongoDao;

	@RequestMapping(value = "/my_chat_room")
	public ModelAndView my_chat_room(HttpServletRequest request,
			@RequestParam(value = "listener_email", required = false) String listener_email,
			@RequestParam(value = "listener_nick", required = false) String listener_nick) {

		ModelAndView mv = new ModelAndView("/chat/my_chat");

		// 로그인 정보 가져오기
		HttpSession session = request.getSession();

		// 유저 타입 가져오기(토커, 리스너)
		String userType = (String) session.getAttribute("userType");

		// 읽지 않은 메시지 갯수 (토커, 리스너)
		List<Integer> cntList = new ArrayList<>();

		if (userType.equals("talker")) {	//receiver가 talker
			TalkerVo talker = (TalkerVo) session.getAttribute("authUser");
			String tk_email = talker.getEmail();
			String tk_nick = talker.getNickname();

			// 현재 토커와 리스너의 채팅방이 존재하지 않다면 새로 생성
			if (listener_email != null && listener_nick != null) {
				ChatroomVo chatroom = chatroomService.getChatroom(tk_email, listener_email);
				if (chatroom == null) {
					chatroomService.createChatroom(tk_email, tk_nick, listener_email, listener_nick);
					chatroom = chatroomService.getChatroom(tk_email, listener_email);
				}

				// 현재 토커와 리스너의 채팅방 가져오기
				mv.addObject("curChatroom", chatroom);
			}

			// 현재 토커의 모든 채팅방 가져오기
			List<ChatroomVo> list = chatroomService.getTalkerChatroomList(tk_email);
			mv.addObject("chatroomList", list);

			for (int i = 0; i < list.size(); i++) {
				cntList.add(mongoDao.receiver_response_count(String.valueOf(list.get(i).getIdx()), tk_email));
				System.out.println(tk_email+"(receiver) => " +cntList.get(i));
			}
			mv.addObject("cntList", cntList);

		} else if (userType.equals("listener")) {
			ListenerVo listener = (ListenerVo) session.getAttribute("authUser");
			String ls_email = listener.getEmail();

			// 현재 리스너 모든 채팅방 가져오기
			List<ChatroomVo> list = chatroomService.getListenerChatroomList(ls_email);
			mv.addObject("chatroomList", list);

			for (int i = 0; i < list.size(); i++) {
				cntList.add(mongoDao.receiver_response_count(String.valueOf(list.get(i).getIdx()),ls_email));
				System.out.println(ls_email+"(receiver) => " +cntList.get(i));
			}
			mv.addObject("cntList", cntList);
		}

		return mv;
	}

	@RequestMapping(value = "/my_chat")
	@ResponseBody
	public Map<String, List<Object>> my_chat(HttpServletRequest request,
			@RequestParam("chatroom_num") String chatroom_num) {
		Map<String, List<Object>> map = new HashMap<>();
		List<Object> chatList = mongoDao.chat_select(chatroom_num);
		map.put("chat", chatList);
		return map;
	}
}
