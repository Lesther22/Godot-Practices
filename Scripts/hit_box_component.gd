extends Area2D
class_name HitBoxComponent

@export var damage: int = 1

func _ready():
	#HitBox detectara los HealthComponent
	area_entered.connect(hit)
	
func hit(area):
	if area is HealthComponent:
		area.take_damage(damage)
