extends CharacterBody2D
class_name Blanka
const Blanka_Speed = 70
@onready var BlankaAnims = $AnimatedSprite2D
@onready var Sensor: Area2D = $"Sensor"
var player: CollisionObject2D
