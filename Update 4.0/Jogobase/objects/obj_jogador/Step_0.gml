var velocidade = 5;

// --- MOVIMENTAÇÃO HORIZONTAL ---
if (keyboard_check(ord("A"))) {
    direcao = -1;
    if (!place_meeting(x - velocidade, y, colisao)) {
        x -= velocidade;
    }
}
else if (keyboard_check(ord("D"))) {
    direcao = 1;
    if (!place_meeting(x + velocidade, y, colisao)) {
        x += velocidade;
    }
}

if(cooldown > 0) {
	cooldown -= 1;	
}

if(cooldown == 0 && keyboard_check(ord("E"))) {
	if(place_meeting(x,y,obj_inimigo_robo)) {
		obj_inimigo_robo.vida -= dano;	
	}
	
	cooldown = tempo_cooldown;
}

// --- PULO E GRAVIDADE ---
var key_jump = keyboard_check_pressed(vk_space);
var grounded = place_meeting(x, y + 1, obj_chao);

if (key_jump && grounded) {
    show_debug_message("Esta no chao! Pulou!");
    vspd = jumpspeed;
}

if (!grounded) {
    vspd += grv;
}

// Colisão vertical com o chão
if (place_meeting(x, y + vspd, obj_chao)) {
    while (!place_meeting(x, y + sign(vspd), obj_chao)) {
        y += sign(vspd);
    }
    vspd = 0;
}

y += vspd;

// ---Controle de animação e sprites---
if (!grounded) {
    if (direcao == 1) {
        sprite_index = jumpingD;
    } else {
        sprite_index = jumpingA;
    }
    
    image_speed = 0.2;
    if (image_index >= image_number - 1) {
        image_speed = 0;
    }
} 
else {
    image_speed = 1; 
    
    if (keyboard_check(ord("A"))) {
        sprite_index = spr_andando_jogadorE;
    } 
    else if (keyboard_check(ord("D"))) {
        sprite_index = spr_andando_jogadorD;
    } 
    else {
        if (direcao == 1) {
            sprite_index = spr_parado_jogadorD;
        } else {
            sprite_index = spr_parado_jogadorE;
        }
    }
}


if (place_meeting(x, y, portal)) 
{
    if (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_up)) 
    {
        
        if (!instance_exists(obj_transicao)) 
        {
            var _inst_portal = instance_place(x, y, portal);
            var _trans = instance_create_depth(0, 0, -9999, obj_transicao);
            
            _trans.estado_fade = 1; // inicia Fade Out
            _trans.alpha = 0;
            _trans.velocidade_fade = 0.02;
            
            // Lógica de destino correta:
            if (_inst_portal != noone && variable_instance_exists(_inst_portal, "target_room") && room_exists(_inst_portal.target_room)) {
                _trans.sala_destino = _inst_portal.target_room;
            } else if (room_exists(cidade)) {
                _trans.sala_destino = cidade;
            } else {
                _trans.sala_destino = room_next(room); // room_next da SALA ATUAL (room)
            }
            
        }
    }
}