# .
class PublicChartTree
  # A ChildNode instance represents any node below the root.
  ChildNode = Struct.new(:parent, :short_title) do
    attr_accessor :long_title

    delegate :breadcrumb,
             to: :parent,
             prefix: true

    delegate :bundle,
             to: :parent

    def initialize(parent:, short_title:)
      super(parent, short_title)
    end

    def id_components
      parent.id_components + [id_component]
    end

    def breadcrumb
      [short_title]
    end

    def bundle?
      false
    end

    def siblings_and_self
      parent.children
    end

    private

    def id_component
      short_title.parameterize
    end
  end
end