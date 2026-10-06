// --- EVENTO DRAW END DO obj_transicao ---

// Pega a posição e o tamanho da câmara atual do jogo
var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);
var _cam_w = camera_get_view_width(view_camera[0]);
var _cam_h = camera_get_view_height(view_camera[0]);

// Desenha o retângulo preto na frente da câmara
draw_set_color(c_black);
draw_set_alpha(alpha);
draw_rectangle(_cam_x, _cam_y, _cam_x + _cam_w, _cam_y + _cam_h, false);

// Reseta as configurações
draw_set_alpha(1);
draw_set_color(c_white);