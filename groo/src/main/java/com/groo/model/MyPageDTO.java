package com.groo.model;

import lombok.Data;

@Data
public class MyPageDTO {
	
    int board_no;
    String board_user_id;
    String board_email;
    String board_title;
    String team_title;
    String board_content;
    String my_review;
    String my_board_title;
    int board_view;
    int board_like;
    String board_created_at;
    String board_updated_at;

}
