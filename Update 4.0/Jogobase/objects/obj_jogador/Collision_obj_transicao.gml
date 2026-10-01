
// 1. verifica se o jogador está encostado em algum portal
if (place_meeting(x, y, portal)) 
{
    // 2. ativa se o jogador pressionar 'E', 'W' ou 'SETA PRA CIMA'
    if (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up)) 
    {
        // se a transição ainda não começou cria o obj_transicao
        if (!instance_exists(obj_transicao)) 
        {
            // pega a referência exata da instância do portal onde o jogador está encostado
            var _inst_portal = instance_place(x, y, portal);
            
            var _trans = instance_create_depth(0, 0, -9999, obj_transicao);
            _trans.estado_fade = 1; // Inicia o Fade Out
            _trans.alpha = 0;
            _trans.velocidade_fade = 0.02;
            
            // define a sala de destino testando as variáveis
            if (_inst_portal != noone && variable_instance_exists(_inst_portal, "target_room") && room_exists(_inst_portal.target_room)) {
                _trans.sala_destino = _inst_portal.target_room;
            } 
            else if (room_exists(cidade)) {
                _trans.sala_destino = cidade;
            } 
            else {
                _trans.sala_destino = room_next(room);
            }
            
            show_debug_message("Transição criada para a sala: " + string(_trans.sala_destino));
        }
    }
}