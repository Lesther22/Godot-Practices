extends Stado_Base
func on_physics_process(delta: float) -> void:
	if controlled_node.player != null:
		var direccion = controlled_node.player.global_position - controlled_node.global_position
		var distancia = controlled_node.global_position.distance_to(controlled_node.player.global_position)
		if distancia > 125:
			controlled_node.BlankaAnims.play("Blanka_Walk")
			if direccion.x > 0:
				controlled_node.velocity.x = controlled_node.Blanka_Speed
				controlled_node.BlankaAnims.flip_h = false
			else:
				controlled_node.velocity.x = -controlled_node.Blanka_Speed
				controlled_node.BlankaAnims.flip_h = true
	
	if not controlled_node.is_on_floor():
		controlled_node.velocity += controlled_node.get_gravity() * delta
	controlled_node.move_and_slide()
	
func _on_sensor_body_entered(body: Node2D) -> void:
	controlled_node.player = body

func _on_sensor_body_exited(body: Node2D) -> void:
	controlled_node.player = null
