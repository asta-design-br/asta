class Step < ApplicationRecord
  belongs_to :bid

  has_many_attached :files, dependent: :destroy

  validates :title, :due_date, :sequence_id, presence: true
  validates :sequence_id, :price_cents, numericality: { only_integer: true, grater_than_or_equal_to: 0 }
  validates :notes, length: { minimum: 50 }
  validates :title, length: { maximum: 50 }

  validate :sequential_id_validation, :sequential_due_date_validation

  private

  def first_step?
    bid.present? && bid.steps.empty? && sequence_id.zero?
  end

  def sequence_id_higher_than_step_before?
    sequence_id > (bid.steps.max_by(&:sequence_id).sequence_id)
  end

  def sequence_due_date_higher_than_step_before?
    due_date > bid.steps.max_by(&:due_date).due_date
  end

  def sequential_id_validation
    return unless sequence_id.present? && !first_step? && !sequence_id_higher_than_step_before?

    errors.add(:sequence_id, 'steps must be sequentials')
  end

  def sequential_due_date_validation
    return unless !bid.steps.empty? && due_date.present? && !sequence_due_date_higher_than_step_before?

    errors.add(:due_date, 'the due date must be after the due date of the step that came before')
  end
end
