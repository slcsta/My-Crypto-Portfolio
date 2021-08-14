class Trade < ApplicationRecord
  belongs_to :crypto
  belongs_to :user
 
  validates :description, presence: true
  validates :quantity, presence: true, numericality: {greater_than: 0}

  scope :order_by_created_at, -> {order(:created_at).limit(10)}
  
end



# <%= form_for([@crypto, @trade]) do |f| %>
#   <%= f.label :description %>
#   <%= f.text_field :description %>
#   <br>
#   <br>
#   <%= f.label :quantity %>
#   <%= f.number_field :quantity %>
#   <br>
#   <br>
#   <%= f.hidden_field :created_at, value: @trade.created_at %>
#   <br>
#   <br>
#   <%= f.hidden_field :crypto_id, value: @crypto.id %>
#   <%= f.submit %>
# <% end %>


