class ReceiptCalculator
  RegExp = /(\d+) ([\D+ \s]+) at (\d+.\d+)/

  attr_reader :products

  def initialize
    @products = []
  end

  def add_product(description)
    if description.match?(RegExp)
      match_data = description.scan(RegExp).first

      @products.push({
        quantity: match_data[0].to_i,
        description: match_data[1],
        total_price: match_data[2].to_f
      })
    end
  end

  def print_taxes
    result = ""

    total_taxes = 0.0
    total = 0.0
    products.each do |product|
      product_tax = (product[:total_price] * 0.1)
      total_taxes += product_tax
      product_with_tax = product_tax + product[:total_price]
      total += product_with_tax

      result += "#{product[:quantity]} #{product[:description]}: #{product_with_tax}\n"
    end

    result += "Sales Taxes: #{total_taxes}\n"
    result += "Total: #{total}\n"

    return result
  end
end
