extends Stado_Base

func on_physics_process(delta: float) -> void:
	controlled_node.BlankaAnims.play("Blanka_Idle")
	
	if not controlled_node.is_on_floor():
		controlled_node.velocity += controlled_node.get_gravity() * delta
	controlled_node.move_and_slide()
