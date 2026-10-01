// --- EVENTO DRAW GUI DO obj_transicao ---

// 1. Pega a largura e altura reais do monitor/janela do jogo
var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

// 2. Se por algum motivo a GUI devolver 0, usa a largura/altura da janela
if (_gui_w <= 0) _gui_w = window_get_width();
if (_gui_h <= 0) _gui_h = window_get_height();

// 3. Desenha o retângulo preto a cobrir toda a tela
draw_set_color(c_black);
draw_set_alpha(alpha);
draw_rectangle(0, 0, _gui_w, _gui_h, false);

// 4. Reseta as configurações de desenho para não estragar a interface do resto do jogo
draw_set_alpha(1);
draw_set_color(c_white);