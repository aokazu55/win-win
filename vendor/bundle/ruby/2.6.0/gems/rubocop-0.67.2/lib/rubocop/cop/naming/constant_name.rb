# frozen_string_literal: true

module RuboCop
  module Cop
    module Naming
      # This cop checks whether constant names are written using
      # SCREAMING_SNAKE_CASE.
      #
      # To avoid false positives, it ignores cases in which we cannot know
      # for certain the type of value that would be assigned to a constant.
      #
      # @example
      #   # bad
      #   InchInCm = 2.54
      #   INCHinCM = 2.54
      #   Inch_In_Cm = 2.54
      #
      #   # good
      #   INCH_IN_CM = 2.54
      class ConstantName < Cop
        MSG = 'Use SCREAMING_SNAKE_CASE for constants.'.freeze
        # Use POSIX character classes, so we allow accented characters rather
        # than just standard ASCII characters
        SNAKE_CASE = /^[[:digit:][:upper:]_]+$/.freeze

        def_node_matcher :class_or_struct_return_method?, <<-PATTERN
          (send
            (const _ {:Class :Struct}) :new
            ...)
        PATTERN

        def on_casgn(node)
          if node.parent && node.parent.or_asgn_type?
            lhs, value = *node.parent
            _scope, const_name = *lhs
          else
            _scope, const_name, value = *node
          end

          # We cannot know the result of method calls like
          # NewClass = something_that_returns_a_class
          # It's also ok to assign a class constant another class constant,
          # `Class.new(...)` or `Struct.new(...)`
          # SomeClass = SomeOtherClass
          # SomeClass = Class.new(...)
          # SomeClass = Struct.new(...)
          return if allowed_assignment?(value)

          add_offense(node, location: :name) if const_name !~ SNAKE_CASE
        end

        private

        def allowed_assignment?(value)
          value && %i[block const casgn].include?(value.type) ||
            allowed_method_call_on_rhs?(value) ||
            class_or_struct_return_method?(value) ||
            allowed_conditional_expression_on_rhs?(value)
        end

        def allowed_method_call_on_rhs?(node)
          node && node.send_type? &&
            (node.receiver.nil? || !literal_receiver?(node))
        end

        def_node_matcher :literal_receiver?, <<-PATTERN
          {(send literal? ...)
           (send (begin literal?) ...)}
        PATTERN

        def allowed_conditional_expression_on_rhs?(node)
          node && node.if_type? && contains_contant?(node)
        end

        def contains_contant?(node)
          node.branches.any?(&:const_type?)
        end
      end
    end
  end
end
