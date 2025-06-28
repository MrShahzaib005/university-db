use university_db;
-- Add Foreign Key Constraints
ALTER TABLE `users` 
ADD CONSTRAINT `fk_roleId` 
FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`);

ALTER TABLE `tenant_company` 
ADD CONSTRAINT `fk_company_size` 
FOREIGN KEY (`company_size`) REFERENCES `company_size` (`id`);

ALTER TABLE `card_ten_worker` 
ADD CONSTRAINT `fk_card_type` 
FOREIGN KEY (`title`) REFERENCES `card_type` (`id`);

ALTER TABLE `card_ten_worker` 
ADD CONSTRAINT `fk_approval_user` 
FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`);

ALTER TABLE `inventory` 
ADD CONSTRAINT `fk_supplier` 
FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`);

ALTER TABLE `parking_tag` 
ADD CONSTRAINT `fk_tenant_company` 
FOREIGN KEY (`issued_to`) REFERENCES `tenant_company` (`id`);

ALTER TABLE `gate_pass` 
ADD CONSTRAINT `fk_card_worker` 
FOREIGN KEY (`issued_by`) REFERENCES `card_ten_worker` (`id`);

ALTER TABLE `meeting_room` 
ADD CONSTRAINT `location_fk` 
FOREIGN KEY (`location`) REFERENCES `meeting_location` (`id`);

ALTER TABLE `meeting_room` 
ADD CONSTRAINT `reserved_by_fk` 
FOREIGN KEY (`reserved_by`) REFERENCES `tenant_company` (`id`);

ALTER TABLE `news_event` 
ADD CONSTRAINT `event_organizer_fk` 
FOREIGN KEY (`organizer`) REFERENCES `tenant_company` (`id`);

ALTER TABLE `cleaning_service` 
ADD CONSTRAINT `equested_by_fk` 
FOREIGN KEY (`requested_by`) REFERENCES `tenant_company` (`id`);

ALTER TABLE `event_request` 
ADD CONSTRAINT `requested_by_fk` 
FOREIGN KEY (`requested_by`) REFERENCES `tenant_company` (`id`);

ALTER TABLE `petty_cash` 
ADD CONSTRAINT `fk_card_worker_used` 
FOREIGN KEY (`used_by`) REFERENCES `card_ten_worker` (`id`);

ALTER TABLE `petty_cash` 
ADD CONSTRAINT `requested_by_petty_fk` 
FOREIGN KEY (`requested_by`) REFERENCES `tenant_company` (`id`);