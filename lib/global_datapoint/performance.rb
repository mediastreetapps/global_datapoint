class Performance
  def self.build_from(options, title)
    new(
      :performance_id => options.attributes['performance_id'].value,
      :created_date => date_from(options.children.detect {|o| o.name == 'created_date'}.children.first.text),
      :modified_date => date_from(options.children.detect {|o| o.name == 'modified_date'}.children.first.text),
      :description => options.children.detect {|o| o.name == 'performance_description'}.children.first.text,
      :start_date => date_from(options.children.detect {|o| o.name == 'start_date'}.children.first.text),
      :end_date => date_from(options.children.detect {|o| o.name == 'end_date'}.children.first.text),
      :title => title

    )
  end

  def self.date_from(date)
    Date.strptime(date, '%d/%m/%Y')
  end

  def initialize(options)
    @options = options
  end

  def created_date
    attribute_for(:created_date)
  end

  def modified_date
    attribute_for(:modified_date)
  end

  def description
    attribute_for(:description)
  end

  def start_date
    attribute_for(:start_date)
  end

  def end_date
    attribute_for(:end_date)
  end

  def title
    attribute_for(:title)
  end

  private
  def attribute_for(attr)
    @options.fetch(attr, nil)
  end
end
