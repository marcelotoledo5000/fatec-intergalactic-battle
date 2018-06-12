module Matches
  module GameBoards
    class BaseController < ApplicationController
      before_action :authenticate_player!
      before_action :load_match
      before_action :load_game_board

      private

      def game_board_id
        params[:id]
      end

      def load_match
        @match = Match.find(params[:match_id])
      end

      def load_game_board
        @game_board = @match.game_boards.find_by!(
          id: game_board_id,
          player: current_player
        )
      end
    end
  end
end