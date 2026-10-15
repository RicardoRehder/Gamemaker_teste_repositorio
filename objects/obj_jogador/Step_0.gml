var velocidade = 5;

if(room == cidade){
	depth = 1;
}

var _terminal = instance_find(obj_terminal, 0);

if (_terminal != noone && _terminal.ativo)
{
    vspd = 0;
    exit;
}

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


var key_jump = keyboard_check_pressed(vk_space);
var grounded = place_meeting(x, y + 1, obj_chao);

if (key_jump && grounded) {
    show_debug_message("Esta no chao! Pulou!");
    vspd = jumpspeed;
}

if (!grounded) {
    vspd += grv;
}


if (place_meeting(x, y + vspd, obj_chao)) {
    while (!place_meeting(x, y + sign(vspd), obj_chao)) {
        y += sign(vspd);
    }
    vspd = 0;
}

y += vspd;


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

if (place_meeting(x, y, obj_porta))
{
    if (keyboard_check_pressed(ord("E")) ||
        keyboard_check_pressed(ord("W")) ||
        keyboard_check_pressed(vk_up))
    {
        if (!instance_exists(obj_transicao))
        {
            var _trans = instance_create_depth(0, 0, -9999, obj_transicao);

            _trans.estado_fade = 1;
            _trans.alpha = 0;
            _trans.velocidade_fade = 0.02;

            _trans.sala_destino = room_next(room);
        }
    }
}
// --- EVENTO STEP DO obj_jogador ---

if(cooldown > 0) {
	cooldown -= 1;	
}

if (keyboard_check_pressed(ord("Q"))) 
{

    if (place_meeting(x,y,obj_inimigo_robo) && cooldown <= 0) 
    {
        obj_inimigo_robo.vida_atual -= 20;
        cooldown = tempo_cooldown;
    }
}

if(vida_atual <= 0) {
	room_restart();	
}