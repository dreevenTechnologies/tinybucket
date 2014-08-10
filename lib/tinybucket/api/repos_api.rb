module Tinybucket
  module Api
    class ReposApi < BaseApi
      def list(options = {})
        path = path_to_list(options)

        opts = options.clone
        opts.delete(:owner)
        parser = Tinybucket::Parser::ReposParser
        list = get_path(path, opts, parser)

        # pass @config to each repo as api_config
        list.each { |repo| repo.api_config = @config.dup }
        list
      end

      private

      def path_to_list(options)
        path  = '/repositories'
        path += '/' + options[:owner] if options[:owner].present?
        path
      end
    end
  end
end
