require 'test_helper'

class PostTest < ActiveSupport::TestCase
   test "Don't save post without title" do
     post = Post.new
     # assert !post.valid?, "post without title saved"
     assert !post.save, "post without title saved"
   end
   
   test "Don't save post without body" do
     post = Post.new
     # assert !post.valid?, "post without body saved"
     assert !post.save, "post without body saved"
   end
end
