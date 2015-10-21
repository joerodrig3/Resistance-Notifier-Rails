class Group < ActiveRecord::Base
  has_many :users

  def generate_roles player_count
    unless player_count < 5
      role_count = case player_count
        when 5 then  {spies: 2, resistance: 3}
        when 6 then  {spies: 2, resistance: 4}
        when 7 then  {spies: 3, resistance: 4}
        when 8 then  {spies: 3, resistance: 5}
        when 9 then  {spies: 3, resistance: 6}
        when 10 then {spies: 4, resistance: 6}
      end
      ((["Spy"] * role_count[:spies]) + (["Resistance"] * role_count[:resistance]))
    end
  end

  def update_role_count(user, role)
  end

  def assign_player_roles playerIDS
    roles = generate_roles playerIDS.length

    players = []
    playerIDS.each do |id|
      players << { player: User.find(id), role: roles.shift }
    end
    binding.pry
    players
  end


end
