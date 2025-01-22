extends CharacterBody2D
class_name player
const SPEED = 175
const GRAVEDAD = 9.80
const JUMP_VELOCITY = -400
@onready var GuyAnims = $AnimatedSprite2D
@onready var sensor: Area2D = $"Sensor"
