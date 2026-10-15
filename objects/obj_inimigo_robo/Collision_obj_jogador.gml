if(cooldown >0) {
	cooldown -= 1;	
}


if (place_meeting(x, y, obj_jogador) && cooldown <= 0) {
    obj_jogador.vida_atual -= 1;
	cooldown = tempo_cooldown;
	}