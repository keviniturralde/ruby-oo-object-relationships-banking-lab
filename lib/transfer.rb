class Transfer

  attr_accessor :status, :sender, :receiver, :amount
  # your code here

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid? == true
      return true
    else
      false 
    end
  end

  def execute_transaction
    if valid? && sender.balance >= @amount && @status == "pending"
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
   if execute_transaction && @status = "reversed"
      sender.balance += @amount
      receiver.balance -= @amount
   end
  end
end