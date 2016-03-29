package com.bit.kuku.chat;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.bit.kuku.chat.ChatWebSocketHandler;

@Configuration
@EnableWebMvc
@EnableWebSocket //webSocketHandler를 Spring@MVC에 통합하기 위해
public class WebConfig extends WebMvcConfigurerAdapter implements WebSocketConfigurer {
	
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(chatHandler(), "/chat").withSockJS();
    }
    
    @Bean
    public WebSocketHandler chatHandler() {
        return new ChatWebSocketHandler();
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }
}
