var _jogador = instance_find(obj_jogador, 0);

// TERMINAL FECHADO
if (!ativo)
{
    if (_jogador != noone)
    {
        if (point_distance(x, y, _jogador.x, _jogador.y) < 64
        && keyboard_check_pressed(ord("E")))
        {
            ativo = true;
            global.terminal_ativo = true;

            keyboard_string = "";
            codigo_digitado = "";
        }
    }

    exit;
}

// AGUARDA SOLTAR A TECLA E
if (keyboard_check(ord("E")))
{
    keyboard_string = "";
    exit;
}

// FECHAR COM ESC
if (keyboard_check_pressed(vk_escape))
{
    ativo = false;
    global.terminal_ativo = false;

    codigo_digitado = "";
    keyboard_string = "";
    exit;
}

// CAPTURAR TEXTO
codigo_digitado = keyboard_string;

// EXECUTAR COM ENTER
if (keyboard_check_pressed(vk_enter))
{
    var _codigo = string_trim(codigo_digitado);

    if (_codigo != "")
    {
        processar_codigo_c(_codigo);
    }

    codigo_digitado = "";
    keyboard_string = "";
}