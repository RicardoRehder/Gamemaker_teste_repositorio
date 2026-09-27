var velocidade = 5;
depth = 1;

if (keyboard_check(ord("A"))) {
    sprite_index = spr_andando_jogadorE;
    direcao = 1;
	
    if (!place_meeting(x - velocidade, y, colisao)) {
        x -= velocidade;
    }
}


else if (keyboard_check(ord("D"))) {
    sprite_index = spr_andando_jogadorD;
    direcao=-1;

    if (!place_meeting(x + velocidade, y, colisao)) {
        x += velocidade;
    }
}

else if(!keyboard_check(ord("A")) && !keyboard_check(ord("D"))){
	if(direcao==1) {
		sprite_index = spr_parado_jogadorE;	
	}
	if(direcao==-1) {
		sprite_index = spr_parado_jogadorD;	
	}
	
}



 if(place_meeting(x,y,portal)) {
	 room_goto_next();
 }
 