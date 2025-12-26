;Ayomide Ojediran
;Last updated November, 2025
;PROJECT NAME: 10-16 QUIZ
;This is a quiz game where the player has to answer 15 questions to win
;The objective is to convert decimal numbers to hexadecimal numbers and the user has only 4 lives

TRAFFIC_LIGHTS EQU &FFF		;Address for traffic lights
KEYPAD EQU &FF2			;Address for keypad
BUZZER EQU &FFD			;Address for Buzzer
BUSY EQU &FF3			;Address for Buzzer Busy
SIMPLE_BUTTONS EQU &FF0		;Address for simple buttons
DIGIT_5 EQU &FFA        ;Leftmost
DIGIT_4 EQU &FF9
DIGIT_3 EQU &FF8
DIGIT_2 EQU &FF7
DIGIT_1 EQU &FF6
DIGIT_0 EQU &FF5        ;Rightmost
;======================INSTRUCTIONS===============================================
initial_start
    LDA lights_start
    STA TRAFFIC_LIGHTS
   LDA display_H		;Display HELLO
   STA DIGIT_5
   LDA display_E
   STA DIGIT_4
   LDA display_L
   STA DIGIT_3
   LDA display_L
   STA DIGIT_2
   LDA display_O
   STA DIGIT_1
   LDA display_dash
   STA DIGIT_0
;============MODULE DELAYS ============   
song5   LDA s5_n1       ; C
        STA BUZZER
wait5a  LDA BUSY
        JNE wait5a
        LDA s5_n2       ; E
        STA BUZZER
wait5b  LDA BUSY
        JNE wait5b
        LDA s5_n3       ; F
        STA BUZZER
wait5c  LDA BUSY
        JNE wait5c
        LDA s5_n4       ; G (Hold slightly)
        STA BUZZER
wait5d  LDA BUSY
        JNE wait5d
        LDA s5_n5       ; E
        STA BUZZER
wait5e  LDA BUSY
        JNE wait5e
        LDA s5_n6       ; C
        STA BUZZER
wait5f  LDA BUSY
        JNE wait5f
        LDA s5_n7       ; Low G
        STA BUZZER
wait5g  LDA BUSY
        JNE wait5g
        LDA s5_n8       ; C (Final Note)
        STA BUZZER
wait5h  LDA BUSY
        JNE wait5h
;=============END MODULE DELAYS ============
   LDA display_C		;Display CHANGE
   STA DIGIT_5
   LDA display_H
   STA DIGIT_4
   LDA display_A
   STA DIGIT_3
   LDA display_N
   STA DIGIT_2
   LDA display_G
   STA DIGIT_1
   LDA display_E
   STA DIGIT_0   
 ;============MODULE DELAYS ============   
LDA six
STA delay_count
JMP func_delay
delay_return6
;=============END MODULE DELAYS ============
   LDA display_F		;Display FROM
   STA DIGIT_5
   LDA display_R
   STA DIGIT_4
   LDA display_0
   STA DIGIT_3
   LDA display_M
   STA DIGIT_2
   LDA display_dash
   STA DIGIT_1
   LDA display_dash
   STA DIGIT_0
;============MODULE DELAYS ============   
LDA seven
STA delay_count
JMP func_delay
delay_return7
;=============END MODULE DELAYS ============
   LDA display_B		;Display BASE10
   STA DIGIT_5
   LDA display_A
   STA DIGIT_4
   LDA display_S
   STA DIGIT_3
   LDA display_E
   STA DIGIT_2
   LDA display_1
   STA DIGIT_1
   LDA display_0
   STA DIGIT_0
;============MODULE DELAYS ============   
LDA eight
STA delay_count
JMP func_delay
delay_return8
;=============END MODULE DELAYS ============
   LDA display_dash		;Display TO
   STA DIGIT_5
   LDA display_dash
   STA DIGIT_4
   LDA display_T
   STA DIGIT_3
   LDA display_O
   STA DIGIT_2
   LDA display_dash
   STA DIGIT_1
   LDA display_dash
   STA DIGIT_0
  ;============MODULE DELAYS============   
LDA nine
STA delay_count
JMP func_delay
delay_return9
;=============END MODULE DELAYS ============
   LDA display_B		;Display BASE16
   STA DIGIT_5
   LDA display_A
   STA DIGIT_4
   LDA display_S
   STA DIGIT_3
   LDA display_E
   STA DIGIT_2
   LDA display_1
   STA DIGIT_1
   LDA display_6
   STA DIGIT_0
  ;============MODULE DELAYS============   
LDA ten
STA delay_count
JMP func_delay
;=============END MODULE DELAYS ============  
; Game starts here
game_start
;=============MODULE INITIALIZE ALL VARIABLES=================
    LDA zero
    STA score
    STA win_lose
    STA challenge_index		;To track question
    LDA display_0		; RESET DISPLAY TO ZERO
    STA DIGIT_5
    STA DIGIT_4
    STA DIGIT_3
    STA DIGIT_1
    STA DIGIT_0
    LDA display_multiply	; Set multiply sign in DIGIT_2
    STA DIGIT_2
    LDA four		;START WITH 4 LIVES
    STA current_lives
    LDA lights_4lives
    STA TRAFFIC_LIGHTS
;=============ENDMODULE INITIALIZE ALL VARIABLES=================
;========MODULE DISPLAY QUESTION ==========   
show_challenge
    LDA challenge_index
    SUB zero
    JNE check_challenge_1
    JMP display_challenge_0  
check_challenge_1
    LDA challenge_index
    SUB one
    JNE check_challenge_2
    JMP display_challenge_1  
check_challenge_2
    LDA challenge_index
    SUB two
    JNE check_challenge_3
    JMP display_challenge_2 
check_challenge_3
    LDA challenge_index
    SUB three
    JNE check_challenge_4
    JMP display_challenge_3
check_challenge_4
    LDA challenge_index
    SUB four
    JNE check_challenge_5
    JMP display_challenge_4  
check_challenge_5
    LDA challenge_index
    SUB five
    JNE check_challenge_6
    JMP display_challenge_5
check_challenge_6
    LDA challenge_index
    SUB six
    JNE check_challenge_7
    JMP display_challenge_6
check_challenge_7
    LDA challenge_index
    SUB seven
    JNE check_challenge_8
    JMP display_challenge_7
check_challenge_8
    LDA challenge_index
    SUB eight
    JNE check_challenge_9
    JMP display_challenge_8
check_challenge_9
    LDA challenge_index
    SUB nine
    JNE check_challenge_10
    JMP display_challenge_9
check_challenge_10
    LDA challenge_index
    SUB ten
    JNE check_challenge_11
    JMP display_challenge_10
check_challenge_11
    LDA challenge_index
    SUB eleven
    JNE check_challenge_12
    JMP display_challenge_11
check_challenge_12
    LDA challenge_index
    SUB twelve
    JNE check_challenge_13
    JMP display_challenge_12
check_challenge_13
    LDA challenge_index
    SUB thirteen
    JNE check_challenge_14
    JMP display_challenge_13
check_challenge_14
    LDA challenge_index
    SUB fourteen
    JNE check_challenge_15
    JMP display_challenge_14
check_challenge_15
    LDA one		; If we've completed all challenges, player wins!
    STA win_lose
    JMP show_score
;========DISPLAY QUESTION MODULE END ==========
;===========QUESTION BANK===============
display_challenge_0		; Display challenge 0: 100 (0x64)
    LDA display_1
    STA DIGIT_5
    LDA display_0
    STA DIGIT_4
    LDA display_0
    STA DIGIT_3
    LDA six
    STA correct_first
    LDA four
    STA correct_second
    JMP clear_input
display_challenge_1	; Display challenge 1: 245 (0xF5)
    LDA display_2
    STA DIGIT_5
    LDA display_4
    STA DIGIT_4
    LDA display_5
    STA DIGIT_3
    LDA fifteen
    STA correct_first
    LDA five
    STA correct_second
    JMP clear_input
display_challenge_2	; Display challenge 2: 128 (0x80)
    LDA display_1
    STA DIGIT_5
    LDA display_2
    STA DIGIT_4
    LDA display_8
    STA DIGIT_3
    LDA eight
    STA correct_first
    LDA zero
    STA correct_second
    JMP clear_input
display_challenge_3	; Display challenge 3: 199 (0xC7)
    LDA display_1
    STA DIGIT_5
    LDA display_9
    STA DIGIT_4
    LDA display_9
    STA DIGIT_3
    LDA twelve
    STA correct_first
    LDA seven
    STA correct_second
    JMP clear_input
display_challenge_4	; Display challenge 4: 063 (0x3F)
    LDA display_0
    STA DIGIT_5
    LDA display_6
    STA DIGIT_4
    LDA display_3
    STA DIGIT_3
    LDA three
    STA correct_first
    LDA fifteen
    STA correct_second
    JMP clear_input
display_challenge_5		; Display challenge 5: 255 (0xFF)
    LDA display_2
    STA DIGIT_5
    LDA display_5
    STA DIGIT_4
    LDA display_5
    STA DIGIT_3
    LDA fifteen
    STA correct_first
    LDA fifteen
    STA correct_second
    JMP clear_input
display_challenge_6		; Display challenge 6: 170 (0xAA)
    LDA display_1
    STA DIGIT_5
    LDA display_7
    STA DIGIT_4
    LDA display_0
    STA DIGIT_3
    LDA ten
    STA correct_first
    LDA ten
    STA correct_second
    JMP clear_input
display_challenge_7		; Display challenge 7: 085 (0x55)
    LDA display_0
    STA DIGIT_5
    LDA display_8
    STA DIGIT_4
    LDA display_5
    STA DIGIT_3
    LDA five
    STA correct_first
    LDA five
    STA correct_second
    JMP clear_input 
display_challenge_8		; Display challenge 8: 016 (0x10)
    LDA display_0
    STA DIGIT_5
    LDA display_1
    STA DIGIT_4
    LDA display_6
    STA DIGIT_3
    LDA one
    STA correct_first
    LDA zero
    STA correct_second
    JMP clear_input
display_challenge_9		; Display challenge 9: 222 (0xDE)
    LDA display_2
    STA DIGIT_5
    LDA display_2
    STA DIGIT_4
    LDA display_2
    STA DIGIT_3
    LDA thirteen
    STA correct_first
    LDA fourteen
    STA correct_second
    JMP clear_input
display_challenge_10		; Display challenge 10: 144 (0x90)
    LDA display_1
    STA DIGIT_5
    LDA display_4
    STA DIGIT_4
    LDA display_4
    STA DIGIT_3
    LDA nine
    STA correct_first
    LDA zero
    STA correct_second
    JMP clear_input
display_challenge_11			; Display challenge 11: 189 (0xBD)
    LDA display_1
    STA DIGIT_5
    LDA display_8
    STA DIGIT_4
    LDA display_9
    STA DIGIT_3
    LDA eleven
    STA correct_first
    LDA thirteen
    STA correct_second
    JMP clear_input 
display_challenge_12			; Display challenge 12: 032 (0x20)
    LDA display_0
    STA DIGIT_5
    LDA display_3
    STA DIGIT_4
    LDA display_2
    STA DIGIT_3
    LDA two
    STA correct_first
    LDA zero
    STA correct_second
    JMP clear_input   
display_challenge_13			; Display challenge 13: 207 (0xCF)
    LDA display_2
    STA DIGIT_5
    LDA display_0
    STA DIGIT_4
    LDA display_7
    STA DIGIT_3
    LDA twelve
    STA correct_first
    LDA fifteen
    STA correct_second
    JMP clear_input
display_challenge_14			;Display challenge 14: 136 (0x88)
    LDA display_1
    STA DIGIT_5
    LDA display_3
    STA DIGIT_4
    LDA display_6
    STA DIGIT_3
    LDA eight
    STA correct_first
    LDA eight
    STA correct_second
    JMP clear_input
clear_input
    LDA one             ; FIX: Reset input tracker
    STA which_hold
    LDA display_multiply
    STA DIGIT_2
    ; Clear input digits
    LDA display_dash
    STA DIGIT_1
    LDA display_dash
    STA DIGIT_0
;=========== END QUESTION BANK===============
;=========== MODULE: GET DIGIT===============
get_Digit
    LDA KEYPAD          ; Check if no keypad is clicked
    JNE check_key_0
    JMP get_Digit       ; Loop if nothing pressed
check_key_0       
    LDA KEYPAD
    SUB key_0
    JNE check_key_1
    LDA which_hold
    SUB one
    JNE hold0_2
    LDA display_0
    STA DIGIT_1
    LDA zero
    STA firstDigit 
    JMP wait_release   
hold0_2
    LDA display_0
    STA DIGIT_0
    LDA zero
    STA secondDigit 
    JMP wait_release
check_key_1
    LDA KEYPAD
    SUB key_1
    JNE check_key_2
    LDA which_hold
    SUB one
    JNE hold1_2
    LDA display_1
    STA DIGIT_1
    LDA one 
    STA firstDigit
    JMP wait_release
hold1_2
    LDA display_1
    STA DIGIT_0
    LDA one
    STA secondDigit 
    JMP wait_release
check_key_2
    LDA KEYPAD
    SUB key_2
    JNE check_key_3
    LDA which_hold
    SUB one
    JNE hold2_2
    LDA display_2
    STA DIGIT_1
    LDA two 
    STA firstDigit
    JMP wait_release
hold2_2
    LDA display_2
    STA DIGIT_0
    LDA two
    STA secondDigit 
    JMP wait_release
check_key_3
    LDA KEYPAD
    SUB key_3               
    JNE check_key_4         
    LDA which_hold
    SUB one
    JNE hold3_2
    LDA display_3
    STA DIGIT_1
    LDA three               
    STA firstDigit
    JMP wait_release
hold3_2
    LDA display_3
    STA DIGIT_0
    LDA three               
    STA secondDigit 
    JMP wait_release
check_key_4
    LDA KEYPAD
    SUB key_4               
    JNE check_key_5        
    LDA which_hold
    SUB one
    JNE hold4_2
    LDA display_4
    STA DIGIT_1
    LDA four              
    STA firstDigit
    JMP wait_release
hold4_2
    LDA display_4
    STA DIGIT_0
    LDA four              
    STA secondDigit 
    JMP wait_release
check_key_5
    LDA KEYPAD
    SUB key_5              
    JNE check_key_6        
    LDA which_hold
    SUB one
    JNE hold5_2
    LDA display_5
    STA DIGIT_1
    LDA five             
    STA firstDigit
    JMP wait_release
hold5_2
    LDA display_5
    STA DIGIT_0
    LDA five             
    STA secondDigit 
    JMP wait_release
check_key_6
    LDA KEYPAD
    SUB key_6              
    JNE check_key_7        
    LDA which_hold
    SUB one
    JNE hold6_2
    LDA display_6
    STA DIGIT_1
    LDA six             
    STA firstDigit
    JMP wait_release
hold6_2
    LDA display_6
    STA DIGIT_0
    LDA six             
    STA secondDigit 
    JMP wait_release
check_key_7
    LDA KEYPAD
    SUB key_7              
    JNE check_key_8        
    LDA which_hold
    SUB one
    JNE hold7_2
    LDA display_7
    STA DIGIT_1
    LDA seven            
    STA firstDigit
    JMP wait_release
hold7_2
    LDA display_7
    STA DIGIT_0
    LDA seven             
    STA secondDigit 
    JMP wait_release
check_key_8
    LDA KEYPAD
    SUB key_8              
    JNE check_key_9        
    LDA which_hold
    SUB one
    JNE hold8_2
    LDA display_8
    STA DIGIT_1
    LDA eight            
    STA firstDigit
    JMP wait_release
hold8_2
    LDA display_8
    STA DIGIT_0
    LDA eight             
    STA secondDigit 
    JMP wait_release
check_key_9
    LDA KEYPAD
    SUB key_9             
    JNE check_key_A       
    LDA which_hold
    SUB one
    JNE hold9_2
    LDA display_9
    STA DIGIT_1
    LDA nine             
    STA firstDigit
    JMP wait_release
hold9_2
    LDA display_9
    STA DIGIT_0
    LDA nine             
    STA secondDigit 
    JMP wait_release
check_key_A
    LDA KEYPAD
    SUB key_A              
    JNE check_key_B        
    LDA which_hold
    SUB one
    JNE holdA_2
    LDA display_A
    STA DIGIT_1
    LDA ten             
    STA firstDigit
    JMP wait_release
holdA_2
    LDA display_A
    STA DIGIT_0
    LDA ten            
    STA secondDigit 
    JMP wait_release
check_key_B
    LDA KEYPAD
    SUB key_B             
    JNE check_key_C        
    LDA which_hold
    SUB one
    JNE holdB_2
    LDA display_B
    STA DIGIT_1
    LDA eleven             
    STA firstDigit
    JMP wait_release
holdB_2
    LDA display_B
    STA DIGIT_0
    LDA eleven             
    STA secondDigit 
    JMP wait_release
check_key_C
    LDA KEYPAD
    SUB key_C             
    JNE check_key_D       
    LDA which_hold
    SUB one
    JNE holdC_2
    LDA display_C
    STA DIGIT_1
    LDA twelve             
    STA firstDigit
    JMP wait_release
holdC_2
    LDA display_C
    STA DIGIT_0
    LDA twelve             
    STA secondDigit 
    JMP wait_release
check_key_D
    LDA KEYPAD
    SUB key_D             
    JNE check_key_E        
    LDA which_hold
    SUB one
    JNE holdD_2
    LDA display_D
    STA DIGIT_1
    LDA thirteen             
    STA firstDigit
    JMP wait_release
holdD_2
    LDA display_D
    STA DIGIT_0
    LDA thirteen             
    STA secondDigit 
    JMP wait_release
check_key_E
    LDA KEYPAD
    SUB key_E             
    JNE check_key_F        
    LDA which_hold
    SUB one
    JNE holdE_2
    LDA display_E
    STA DIGIT_1
    LDA fourteen             
    STA firstDigit
    JMP wait_release
holdE_2
    LDA display_E
    STA DIGIT_0
    LDA fourteen            
    STA secondDigit 
    JMP wait_release
check_key_F
    LDA which_hold
    SUB one
    JNE holdF_2
    LDA display_F
    STA DIGIT_1
    LDA fifteen             
    STA firstDigit
    JMP wait_release
holdF_2
    LDA display_F
    STA DIGIT_0
    LDA fifteen           
    STA secondDigit 
wait_release		; Wait for key release before accepting next input
    LDA KEYPAD
    JNE wait_release
    LDA which_hold
    SUB one
    JNE check_answer
    LDA two
    STA which_hold
    JMP get_Digit
;=========== END MODULE===========
;=========== CHECK IF ANSWER IS CORRECT============
check_answer
    LDA firstDigit		 ; Check first digit
    SUB correct_first
    JNE wrong_answer 
    LDA secondDigit		; Check second digit
    SUB correct_second
    JNE wrong_answer 
    LDA score	; If it does not branch to wrong answer then it is correct
    ADD one
    STA score		;increment score
    JMP correct_answer
;=========== END OF BLOCK============
correct_answer
    LDA display_R
    STA DIGIT_5
    LDA display_I
    STA DIGIT_4
    LDA display_G
    STA DIGIT_3
    LDA display_H
    STA DIGIT_2
    LDA display_T
    STA DIGIT_1
    LDA display_dash
    STA DIGIT_0
song1   
        LDA s1_n1       ; Load Note C data
        STA BUZZER      ; Write to buzzer
wait1a  LDA BUSY        ; Load busy flag
        JNE wait1a      ;Wait for the note to finish playing
        LDA s1_n2       
        STA BUZZER      
wait1b  LDA BUSY       
        JNE wait1b      
        LDA s1_n3       
        STA BUZZER      
wait1c  LDA BUSY       
        JNE wait1c      
 ;============DELAYS ============   
LDA zero
STA delay_count
JMP func_delay
delay_return0
;=============DELAYS ============	
    LDA challenge_index	; Move to next question
    ADD one
    STA challenge_index
    JMP show_challenge
wrong_answer
    LDA display_W
    STA DIGIT_5
    LDA display_R
    STA DIGIT_4
    LDA display_O
    STA DIGIT_3
    LDA display_N
    STA DIGIT_2
    LDA display_G
    STA DIGIT_1
    LDA display_dash
    STA DIGIT_0  
song2   
        LDA s2_n1       
        STA BUZZER      
wait2a  LDA BUSY        
        JNE wait2a      
        LDA s2_n2       
        STA BUZZER      
wait2b  LDA BUSY        
        JNE wait2b      
        LDA s2_n3       
        STA BUZZER      
wait2c  LDA BUSY        
        JNE wait2c            
 ;============DELAYS ============   
LDA one
STA delay_count
JMP func_delay
delay_return1
;=============DELAYS ============   
 ; =====DECREASE LIVES==========
    LDA current_lives
    SUB one
    STA current_lives			
    JNE check_3_lives			; Check which life display to show
    JMP show_score		; Game over - no lives left
check_3_lives
    LDA current_lives
    SUB three
    JNE check_2_lives
    LDA lights_3lives
    STA TRAFFIC_LIGHTS
    LDA three
    STA current_lives
    JMP show_challenge
check_2_lives
    LDA current_lives
    SUB two
    JNE check_1_life
    LDA lights_2lives
    STA TRAFFIC_LIGHTS
    LDA two
    STA current_lives
    JMP show_challenge 
check_1_life
    LDA current_lives
    SUB one
    JNE check_0_life
    LDA lights_1life
    STA TRAFFIC_LIGHTS
    LDA one
    STA current_lives
    JMP show_challenge
check_0_life
    LDA zero
    STA win_lose
    JMP show_score
; ======DECREASE LIVES AND SHOW NEXT QUESTION==========
;===========LOSE GAME============
game_over
    ; Display "LOSE" or all dashes
    LDA display_L
    STA DIGIT_5
    LDA display_O
    STA DIGIT_4
    LDA display_S
    STA DIGIT_3
    LDA display_E
    STA DIGIT_2
    LDA display_dash
    STA DIGIT_1
    STA DIGIT_0 
    ; Turn off all lights
    LDA lights_lose
    STA TRAFFIC_LIGHTS  
;ADD LOSE SONG
song4   LDA s4_n1       
        STA BUZZER
wait4a  LDA BUSY
        JNE wait4a
        LDA s4_n2      
        STA BUZZER
wait4b  LDA BUSY
        JNE wait4b
        LDA s4_n3       
        STA BUZZER
wait4c  LDA BUSY
        JNE wait4c
        LDA s4_n4       
        STA BUZZER
wait4d  LDA BUSY
        JNE wait4d
        JMP end_game   
 ;===========LOSE GAME ============
;==========WIN GAME ============
game_won
    ; Display "WIN" 
    LDA display_dash
    STA DIGIT_5
    LDA display_W
    STA DIGIT_4
    LDA display_I
    STA DIGIT_3
    LDA display_N
    STA DIGIT_2
    LDA display_dash
    STA DIGIT_1
    STA DIGIT_0  
    ; Flash all lights
    LDA lights_4lives
    STA TRAFFIC_LIGHTS
 
song3   LDA s3_n1  		;ADD WIN SONG     
        STA BUZZER
wait3a  LDA BUSY
        JNE wait3a
        LDA s3_n2       
        STA BUZZER
wait3b  LDA BUSY
        JNE wait3b
        LDA s3_n3       
        STA BUZZER
wait3c  LDA BUSY
        JNE wait3c
        LDA s3_n4       
        STA BUZZER
wait3d  LDA BUSY
        JNE wait3d
        JMP end_game
;===========WIN GAME============
;===========SHOW SCORE============
show_score
    LDA lights_amber		; Flash lights
    STA TRAFFIC_LIGHTS
    LDA display_dash		; Display "YOU" 
    STA DIGIT_5
    LDA display_Y
    STA DIGIT_4
    LDA display_O
    STA DIGIT_3
    LDA display_U
    STA DIGIT_2
    LDA display_dash
    STA DIGIT_1
    STA DIGIT_0  
 ;============DELAYS ============   
LDA two
STA delay_count
JMP func_delay
delay_return2
;=============DELAYS ============  
    LDA display_dash	; Display "GOT"
    STA DIGIT_5
    LDA display_G
    STA DIGIT_4
    LDA display_O
    STA DIGIT_3
    LDA display_T
    STA DIGIT_2
    LDA display_dash
    STA DIGIT_1
    STA DIGIT_0
  ;============DELAYS ============   
LDA three
STA delay_count
JMP func_delay
delay_return3
;=============DELAYS ============
 ;===========MODULE SEPARATE FIRST AND SECOND DIGITS OF USER SCORE=============
    LDA score
    SUB ten
    JGE modulus
    LDA zero
    STA scoreFirstDigit
    LDA score
    STA scoreSecondDigit
    JMP display_firstScore   
modulus
    LDA one
    STA scoreFirstDigit
    LDA score
    SUB ten
    STA scoreSecondDigit
;===========END MODULE=============
;==============DISPLAY USER_SCORE//15============
 display_firstScore			;First digit of score can either be 0 or 1
    LDA scoreFirstDigit
    JNE check_if1
    LDA display_0
    STA DIGIT_5
    JMP display_secondScore
check_if1
    LDA display_1
    STA DIGIT_5
    JMP display_secondScore
 
;=====SECOND DIGIT=============
display_secondScore
    LDA scoreSecondDigit
    SUB zero
    JNE check2_if1
    LDA display_0
    STA DIGIT_4
    JMP continue
check2_if1
    LDA scoreSecondDigit
    SUB one
    JNE check2_if2
    LDA display_1
    STA DIGIT_4
    JMP continue
check2_if2
    LDA scoreSecondDigit
    SUB two
    JNE check2_if3
    LDA display_2
    STA DIGIT_4
    JMP continue
check2_if3
    LDA scoreSecondDigit
    SUB three
    JNE check2_if4
    LDA display_3
    STA DIGIT_4
    JMP continue
check2_if4
    LDA scoreSecondDigit
    SUB four
    JNE check2_if5
    LDA display_4
    STA DIGIT_4
    JMP continue
check2_if5
    LDA scoreSecondDigit
    SUB five
    JNE check2_if6
    LDA display_5
    STA DIGIT_4
    JMP continue
check2_if6
    LDA scoreSecondDigit
    SUB six
    JNE check2_if7
    LDA display_6
    STA DIGIT_4
    JMP continue
check2_if7
    LDA scoreSecondDigit
    SUB seven
    JNE check2_if8
    LDA display_7
    STA DIGIT_4
    JMP continue
check2_if8
    LDA scoreSecondDigit
    SUB eight
    JNE check2_if9
    LDA display_8
    STA DIGIT_4
    JMP continue
check2_if9
    LDA display_9
    STA DIGIT_4
continue
    LDA display_slash
    STA DIGIT_3
    LDA display_slash
    STA DIGIT_2
    LDA display_1
    STA DIGIT_1
    LDA display_5
    STA DIGIT_0
 ;============DELAYS ============   
LDA four
STA delay_count
JMP func_delay
delay_return4
;=============DELAYS ============
    LDA win_lose
    JNE game_won
    JMP game_over 
;===========END MODULE==========
;===========MODULE DELAY==========
func_delay
    LDA delay
delay_temp
    SUB one
    JNE delay_temp
    LDA delay_loop
    SUB one
    STA delay_loop
    JNE func_delay
    LDA fifteen
    STA delay_loop
;========RETURN TO WHERE THE DELAY FUNCTION WAS CALLED
    LDA delay_count
    SUB zero
    JNE delay_check1
    JMP delay_return0
delay_check1
    LDA delay_count
    SUB one
    JNE delay_check2
    JMP delay_return1
delay_check2
    LDA delay_count
    SUB two
    JNE delay_check3
    JMP delay_return2
delay_check3
    LDA delay_count
    SUB three
    JNE delay_check4
    JMP delay_return3
delay_check4
    LDA delay_count
    SUB four
    JNE delay_check5
    JMP delay_return4
delay_check5
    LDA delay_count
    SUB five
    JNE delay_check6
    ;JMP delay_return5
delay_check6
    LDA delay_count
    SUB six
    JNE delay_check7
    JMP delay_return6
delay_check7
    LDA delay_count
    SUB seven
    JNE delay_check8
    JMP delay_return7
delay_check8
    LDA delay_count
    SUB eight
    JNE delay_check9
    JMP delay_return8
delay_check9
    LDA delay_count
    SUB nine
    JNE delay_check10
    JMP delay_return9
delay_check10
    JMP game_start
;=============END OF DELAYS ============
;============END GAME==============
end_game
    LDA SIMPLE_BUTTONS	;If simple buttons are clicked go to game_start
    JNE game_start
    JMP end_game
;============END GAME==============
;============DEFINITION OF VARIABLES==============

lights_4lives DEFW   &0131   ; All Green LEDs on
lights_3lives DEFW   &0031   ; 3 Green LEDs on
lights_2lives DEFW   &0011   ; 2 Green LEDs on
lights_1life  DEFW   &0001   ; 1 Green LED on
lights_lose DEFW &048C        ;all red
lights_start DEFW &FFFF        ;all LIGHTS ON
lights_amber DEFW &0242  	;ALL amber
display_0  DEFW &003F		;DISPLAY LETTERS AND NUMBERS
display_1  DEFW &0006
display_2  DEFW &00DB
display_3  DEFW &00CF
display_4  DEFW &00E6
display_5  DEFW &00ED
display_6  DEFW &00FD
display_7  DEFW &0007
display_8  DEFW &00FF
display_9  DEFW &00EF
display_A  DEFW &00F7
display_B  DEFW &2479
display_C  DEFW &0039
display_D  DEFW &00DE
display_E  DEFW &00F9
display_F  DEFW &00F1
display_G  DEFW &00BD
display_H  DEFW &00F6
display_I  DEFW &1209
display_L  DEFW &0038
display_M  DEFW &0336
display_N  DEFW &2136
display_O  DEFW &003F
display_R  DEFW &2471
display_S  DEFW &00ED
display_T  DEFW &1201
display_U  DEFW &003E
display_W  DEFW &2836
display_Y  DEFW &1500
display_dash     DEFW &0040
display_slash    DEFW &0C00
display_multiply DEFW &2D00
key_0       DEFW &0001	;KEYPAD VALUES
key_1       DEFW &0002
key_2       DEFW &0004
key_3       DEFW &0008
key_4       DEFW &0010
key_5       DEFW &0020
key_6       DEFW &0040
key_7       DEFW &0080
key_8       DEFW &0100
key_9       DEFW &0200
key_A       DEFW &0400
key_B       DEFW &0800
key_C       DEFW &1000
key_D       DEFW &2000
key_E       DEFW &4000
key_F       DEFW &8000
; Game variables
firstDigit    DEFW &0000		;To get user input
secondDigit   DEFW &0000		;To get user input
correct_first DEFW &0000		;To store correct first digit
correct_second DEFW &0000		;To store correct second digit
challenge_index DEFW &0000		;To store question number
win_lose DEFW &0000			;To store game state
score DEFW &0000			;To hold current score
scoreFirstDigit DEFW &0000		;Used when displaying score
scoreSecondDigit DEFW &0000		;Used when displaying score
current_lives DEFW &0004		;Used when displaying score
delay  DEFW &FFFF			;To implement delays
delay_count DEFW &0000			;To track return address of delays
delay_loop DEFW &000F			;To track number of delays in the loop
which_hold DEFW &0001			;To track whether we are getting the first digit or second digit
; Song 1 
s1_n1   DEFW &8450      ; Dur:4, Oct:5, Note:C (0)
s1_n2   DEFW &8454      ; Dur:4, Oct:5, Note:E (4)
s1_n3   DEFW &8457      ; Dur:4, Oct:5, Note:G (7)
; Song 2 
s2_n1   DEFW &8257      ; Dur:2, Oct:5, Note:G (7)
s2_n2   DEFW &8254      ; Dur:2, Oct:5, Note:E (4)
s2_n3   DEFW &8250      ; Dur:2, Oct:5, Note:C (0)
;Song 3 
s3_n1   DEFW &8250      ; Dur:2 (0.2s), Oct:5, Note:C
s3_n2   DEFW &8254      ; Dur:2 (0.2s), Oct:5, Note:E
s3_n3   DEFW &8257      ; Dur:2 (0.2s), Oct:5, Note:G
s3_n4   DEFW &8C60      ; Dur:C (1.2s), Oct:6, Note:C (High!)
; --- Song 4 
s4_n1   DEFW &8657      ; Dur:6 (0.6s), Oct:5, Note:G
s4_n2   DEFW &8656      ; Dur:6 (0.6s), Oct:5, Note:F#
s4_n3   DEFW &8655      ; Dur:6 (0.6s), Oct:5, Note:F
s4_n4   DEFW &8F54      ; Dur:F (1.5s), Oct:5, Note:E (Long!)
; --- Song 5 Data (ENTRY) ---
; Melody: C4-E4-F4-G4... E4-C4... G3-C4
s5_n1   DEFW &8250      ; Dur:2, Oct:5, C
s5_n2   DEFW &8254      ; Dur:2, Oct:5, E
s5_n3   DEFW &8255      ; Dur:2, Oct:5, F
s5_n4   DEFW &8457      ; Dur:4, Oct:5, G (Longer)
s5_n5   DEFW &8254      ; Dur:2, Oct:5, E
s5_n6   DEFW &8250      ; Dur:2, Oct:5, C
s5_n7   DEFW &8447      ; Dur:4, Oct:4, Low G
s5_n8   DEFW &8850      ; Dur:8 (0.8s), Oct:5, C (Final)
; Number constants
zero      DEFW &0000
one       DEFW &0001
two       DEFW &0002
three     DEFW &0003
four      DEFW &0004
five      DEFW &0005
six       DEFW &0006
seven     DEFW &0007
eight     DEFW &0008
nine      DEFW &0009
ten       DEFW &000A
eleven    DEFW &000B
twelve    DEFW &000C
thirteen  DEFW &000D
fourteen  DEFW &000E
fifteen   DEFW &000F
