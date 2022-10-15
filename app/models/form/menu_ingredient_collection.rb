class Form::MenuIngredientCollection < Form::Base
  attr_accessor :menu_ingredients

  def initialize(form_count, attributes = {})
    super attributes
    self.menu_ingredients = form_count.times.map { MenuIngredient.new() } unless self.menu_ingredients.present?  
  end

  def menu_ingredients_attributes=(attributes)
    self.menu_ingredients = attributes.map { |_, v| MenuIngredient.new(v)}
  end

  def save
    MenuIngredient.transaction do
      self.menu_ingredients.map do |menu_ingredient|
        menu_ingredient.save
      end
    end

    begin
      return true
    rescue => exception
      return false
    end

  end
end