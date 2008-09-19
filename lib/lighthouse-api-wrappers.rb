class TicketStruct < Struct.new( :number, :milestone_id, :milestone_index, :title, :state, :estimated, :actual, :assigned_to_id, :untimed ); end
class MilestoneStruct < Struct.new( :lighthouse_id, :title, :index ); end
class UserStruct < Struct.new( :lighthouse_id, :name ); end