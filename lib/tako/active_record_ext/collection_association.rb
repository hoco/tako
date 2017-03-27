module Tako
  module ActiveRecordExt
    module CollectionAssociation
      def self.included(mod)
        mod.extend(ShardedMethods)
        mod.sharded_methods :reader,
                            :writer,
                            :ids_reader,
                            :ids_writer,
                            :create,
                            :create!,
                            :build,
                            :empty?,
                            :include?,
                            :load_target,
                            :reload,
                            :size,
                            :select
      end
    end
  end
end

ActiveRecord::Associations::CollectionAssociation.class_eval do
  include Tako::ActiveRecordExt::CollectionAssociation
end
