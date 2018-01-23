class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :created_issues, :issues, :district_id
  attribute :my_issues, key: :issues



  # def gang_outlaws
  #     object.outlaws.map{|o| {id: o.id, name: o.name, reward: o.reward}}
  #   end

  # def created_issues
  #   object.created_issues
  # end

  def my_issues
    object.stances.map do |s|
      v = s.view
      i = v.issue
      {issue:{id: i.id, title: i.title, category: i.category}, view: {id: v.id, description: v.description, attitude: v.attitude}, stance: {importance: s.importance}}
    end
  end

end
