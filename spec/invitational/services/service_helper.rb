def setup_user email
  user = User.new(email: email)
  user.save

  user
end

def setup_entity name
  entity = Entity.new(name: name)
  entity.save

  entity
end

def setup_child name, entity
  child = Child.new(name: name)
  child.save

  entity.children << child

  child
end

def setup_grandparent name, entity
  grandparent = Grandparent.new(name: name)
  grandparent.save

  grandparent.entities << entity


  grandparent
end

def setup_other_entity name
  other_entity = OtherEntity.new(name: name)
  other_entity.save

  other_entity
end

def setup_system_thing name
  system_thing = SystemThing.new(name: name)
  system_thing.save

  system_thing
end

def invite_by_email email, entity, role
  invitation = Invitation.new(email: email, invitable: entity, role: role)
  invitation.save

  invitation
end

def invite_user user, entity, role
  invitation = Invitation.new(email: user.email, invitable: entity, role: role, user: user, date_accepted: DateTime.now)
  invitation.save

  invitation
end

def invite_uber_admin user
  invitation = Invitation.new(email: user.email, role: :uberadmin, user: user)
  invitation.save

  invitation
end

def invite_system_role user, role
  invitation = Invitation.new(email: user.email, role: role, user: user)
  invitation.save

  invitation
end

def no_invitations_exist
  Invitation.destroy_all
end
