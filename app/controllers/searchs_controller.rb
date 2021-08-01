class SearchsController < ApplicationController
  def search
    @value = params["value"]
    @model = params["model"]
    @method = params["method"]
    @dates = search_for(@method, @model, @value)
  end
  
  

private

def search_for(method, model, value)
  case method
  when 'match'
    match(model, value)
  when 'forward'
    forward(model, value)
  when 'backward'
    backward(model, value)
  when 'partical'
    partical(model, value)
  end
end





def match(model, value)
  if model == 'user'
    User.where(name: value)
  elsif model == 'book'
    Book.where(title: value)
  end
end

def forward(model, value)
  if model == 'user'
    User.where("name LIKE ?", "#{value}%")
  elsif model == 'book'
    Book.where("title LIKE ?", "#{value}%")
  end
end

def backward(model, value)
  if model == 'user'
    User.where("name LIKE ?", "%#{value}")
  elsif model == 'book'
    Book.where("title LIKE ?", "%#{value}")
  end
end

def partical(model, value)
  if model == 'user'
    User.where("name LIKE ?", "%#{value}%")
  elsif model == 'book'
    Book.where("title LIKE ?", "%#{value}%")
  end
end









end