class PublicChartTree
  # A Node creates a consistent interface to NestedNode instances
  # or RootNode .
  class Node < SimpleDelegator
    attr_reader :children
    delegate :id, to: :parent, prefix: true

    def initialize(*args)
      super
      @children = []
    end

    def id
      id_components.join('/')
    end

    def breadcrumbs
      parent.breadcrumb + breadcrumb
    end

    def breadcrumb
      build_breadcrumb(self)
    end
  end
end