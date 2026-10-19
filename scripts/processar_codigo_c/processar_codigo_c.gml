function processar_codigo_c(_texto)
{
    _texto = string_trim(_texto);

    var _terminal = instance_find(obj_terminal, 0);

    if (_terminal == noone)
    {
        return;
    }

    // MOSTRA O COMANDO DIGITADO
    array_push(
        _terminal.historico_terminal,
        "> " + _texto
    );

    // =================================
    // COMPUTADOR 1: PORTA
    // =================================
    if (_terminal.tipo_computador == 1)
    {
        if (_texto == "int porta = 1;")
        {
            if (!global.porta_liberada)
            {
                global.porta_liberada = true;
                global.desafios_resolvidos++;

                array_push(
                    _terminal.historico_terminal,
                    "SUCESSO: PORTA DESBLOQUEADA!"
                );
            }
            else
            {
                array_push(
                    _terminal.historico_terminal,
                    "A porta ja foi desbloqueada."
                );
            }
        }
        else
        {
            array_push(
                _terminal.historico_terminal,
                "ERRO: codigo incorreto."
            );

            array_push(
                _terminal.historico_terminal,
                "Tente novamente."
            );
        }
    }

    // =================================
    // COMPUTADOR 2: CHAVE
    // =================================
    else if (_terminal.tipo_computador == 2)
    {
        if (_texto == "int chave = 1;")
        {
            if (!global.chave_liberada)
            {
                global.chave_liberada = true;
                global.desafios_resolvidos++;

                array_push(
                    _terminal.historico_terminal,
                    "SUCESSO: CHAVE LIBERADA!"
                );
            }
            else
            {
                array_push(
                    _terminal.historico_terminal,
                    "A chave ja foi liberada."
                );
            }
        }
        else
        {
            array_push(
                _terminal.historico_terminal,
                "ERRO: codigo incorreto."
            );

            array_push(
                _terminal.historico_terminal,
                "Tente novamente."
            );
        }
    }
}