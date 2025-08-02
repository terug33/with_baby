class AddSentimentScoreToStores < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :sentiment_score, :decimal, precision: 5, scale: 3
  end
end
