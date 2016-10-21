module JIRA
  module Resource

    class SprintReportFactory < JIRA::BaseFactory # :nodoc:
    end

    class SprintReport < JIRA::Base
      def self.find( client, rapid_view_id, sprint_id, options = {} )
        response = client.get(path_base(client) + "/rapid/charts/sprintreport?rapidViewId=#{rapid_view_id}&sprintId=#{sprint_id}")
        json = parse_json(response.body)
        client.SprintReport.build(json)
      end

      private

      def self.path_base(client)
        client.options[:context_path] + '/rest/greenhopper/1.0'
      end

      def path_base(client)
        self.class.path_base(client)
      end
    end
  end
end
