// --- DESENHAR GUI (adspace1) ---

// Posição e dimensões da caixa de texto na tela
var _margin = 32;
var _gui_w = display_get_gui_width();
var _gui_h = display_get_gui_height();

var _box_x1 = _margin;
var _box_y1 = _gui_h - 120;
var _box_x2 = _gui_w - _margin;
var _box_y2 = _gui_h - _margin;

// Desenha o fundo da caixa de texto
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(_box_x1, _box_y1, _box_x2, _box_y2, false);

// Desenha a borda da caixa de texto
draw_set_color(c_white);
draw_set_alpha(1);
draw_rectangle(_box_x1, _box_y1, _box_x2, _box_y2, true);

// Configuração da fonte
draw_set_font(Font1); 
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Desenha o texto dactilografado
draw_text_ext(_box_x1 + 16, _box_y1 + 16, texto_exibido, 20, (_box_x2 - _box_x1) - 32);

// Exibe a indicação para apertar ESPAÇO se a mensagem terminou
if (posicao_letra >= string_length(texto_completo) && tempo_espera >= 30) {
    draw_set_halign(fa_right);
    draw_text(_box_x2 - 16, _box_y2 - 24, "Pressione ESPAÇO...");
}

// Reseta os alinhamentos e cores para o padrão
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_color(c_white);