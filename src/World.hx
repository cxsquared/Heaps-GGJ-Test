import system.ISystem;
import component.IComponent;

class World {
	var entities:Array<Entity>;
	var components:Map<String, Map<Int, IComponent>>;
	var systems:Array<ISystem>;

	public function new() {
		entities = new Array<Entity>();
		components = new Map<String, Map<Int, IComponent>>();
		systems = new Array<ISystem>();
	}

	public function newEntity() {
		var entity = new Entity(this);
		entities.push(entity);
		return entity;
	}

	public function addSystem(s:ISystem) {
		systems.push(s);
	}

	public function getComponent(entity:Entity, type:String):Null<IComponent> {
		if (!components.exists(type))
			return null;

		if (!components[type].exists(entity.id))
			return null;

		return components[type][entity.id];
	}

	public function addComponent(entityId:Int, component:IComponent) {
		var componentType = component.getType();
		if (components[componentType] == null) {
			components[componentType] = new Map<Int, IComponent>();
		}

		components[componentType][entityId] = component;
	}

	public function update(dt:Float) {
		for (system in systems) {
			var entitiesToProcess = entities;
			for (type in system.forComponents) {
				entitiesToProcess = getEntitiesWithComponent(entitiesToProcess, type);
			}

			for (entity in entitiesToProcess) {
				system.update(entity, dt);
			}
		}
	}

	function getEntitiesWithComponent(entitiesToFilter:Array<Entity>, componentType:String) {
		var entitiesWithComponent = new Array<Entity>();
		for (entity in entities) {
			if (components[componentType][entity.id] != null) {
				entitiesWithComponent.push(entity);
			}
		}
		return entitiesWithComponent;
	}
}
