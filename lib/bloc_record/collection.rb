module BlocRecord
  class Collection < Array
    def update_all(updates)
      ids = self.map(&:id)
      self.any? ? self.first.class.update(ids, updates) : false
    end

    def take(num = 1)
      if self.any?
        result = []
        if num > 1
          for i...num
            result.push(self[i])
          end
        else
          result = self[0]
        end
        result
      else
        false
      end
    end

    def where(*args)
      self.any? ? self.first.where(args) : false
    end

    def not(*args)
      self.any? ? self.first.not(args) : false
    end

    def destroy_all(*args)
      self.any? ? self.first.destroy_all(args) : false
    end

  end
end
