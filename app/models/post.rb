class Post < ApplicationRecord
    validates_presence_of :title, :article
end
