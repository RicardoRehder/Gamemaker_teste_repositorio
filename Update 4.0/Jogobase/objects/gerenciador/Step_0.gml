if (obj_inimigo_robo.cooldown_spawn > 0) {
    obj_inimigo_robo.cooldown_spawn -= 1;
}


if (obj_inimigo_robo.cooldown_spawn <= 0 && flag < 4) {
    var Xaleatorio = irandom_range(0, 1200);
    
    instance_create_layer(Xaleatorio, 670, "Instances", obj_inimigo_robo);
    obj_inimigo_robo.cooldown_spawn = obj_inimigo_robo.tempo_cooldown_spawn;
    
}
