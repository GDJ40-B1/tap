package com.btf.tap.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.btf.tap.service.UserService;


@Component
public class RemoveScheduler {
	@Autowired UserService userService;
	
	@Scheduled(cron = "0 0 0 * * *")
	public void removeExpirationDate() {
		userService.removeMemberCoupon();
		userService.removeWithdrawalHistory();
	}
}
