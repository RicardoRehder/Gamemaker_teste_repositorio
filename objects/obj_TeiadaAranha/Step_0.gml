y += velocidade;

if(cooldown > 0) {
	cooldown -= 1;	
}

if(place_meeting(x,y-6,obj_chao)) {
	instance_destroy();	
}

if(place_meeting(x,y,obj_jogador) && cooldown <= 0) {
	obj_jogador.vida_atual -= dano;
	cooldown = tempo_cooldown;
}