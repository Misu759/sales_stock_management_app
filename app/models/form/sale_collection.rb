class Form::SaleCollection < Form::Base
  attr_accessor :sales

  def initialize(attributes = {})
    form_count = Menu.count
    super attributes
    self.sales = form_count.times.map { Sale.new() } unless self.sales.present?  
  end

  def sales_attributes=(attributes)
    self.sales = attributes.map { |_, v| Sale.new(v)}
  end

  def save
    Sale.transaction do
      self.sales.map do |sale|
        if sale.quantity
          sale.save
        end
      end
    end

    begin
      return true
    rescue => exception
      return false
    end

  end
end