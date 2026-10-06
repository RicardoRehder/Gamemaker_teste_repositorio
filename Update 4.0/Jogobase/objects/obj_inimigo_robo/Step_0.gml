var velocidade = 2.5;
Xaleatorio = irandom_range(0, 1200);

if(cooldown > 0) {
	cooldown-= 1;
}


if (!place_meeting(x, y, obj_jogador)) {
    
    if (obj_jogador.x > x) {
        sprite_index = spr_robo_andandoD;
        direcao = 1;
        x += velocidade;	
    } 
    else if (obj_jogador.x < x) {
        sprite_index = spr_robo_andandoE;
        direcao = -1;
        x -= velocidade;	
    }

} 

else {
    if (direcao == 1) {
        sprite_index = spr_robo_paradoD;	
    } 
    else if (direcao == -1) {
        sprite_index = spr_robo_paradoE;	
    }
	
    if(cooldown <= 0) {
    obj_jogador.vida -= dano;
	cooldown = tempo_cooldown;
	}

}


if (cooldown_spawn > 0) {
    cooldown_spawn -= 1;
}


if (cooldown_spawn <= 0 && global.flag < 4) {
    var Xaleatorio = irandom_range(0, 1200);
    
   
    instance_create_layer(Xaleatorio, 670, "Instances", obj_inimigo_robo);
    

    global.flag += 1;
    

    cooldown_spawn = tempo_espera;
}

if (obj_jogador.vida == 0) {
    room_restart();
}
