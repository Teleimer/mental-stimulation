//
//  DrillMode.swift
//  Flashcards App
//
//  Created by Trevor Leimer on 1/14/26.
//

import Foundation
import SwiftUI

class DrillSessionManager: ObservableObject, Identifiable {
    let id = UUID()
    enum GradingMode {
        case selfGraded
        case aiAssisted
    }
    
    @Published var isInfiniteMode: Bool
    @Published var gradingMode: GradingMode
    
    // 2. Card Queues
    @Published var activeQueue: [Card] = []
    @Published var currentCard: Card?
    @Published var sessionComplete: Bool = false
    
    // Statistics for this specific session
    @Published var correctCount: Int = 0
    @Published var totalAttempted: Int = 0
    
    init(decks: [Decks], isInfinite: Bool, gradingMode: GradingMode) {
        self.isInfiniteMode = isInfinite
        self.gradingMode = gradingMode
        
        // Flatten all cards from selected decks into one pool
        let allCards = decks.flatMap { $0.cards }
        
        // Shuffle and set the queue
        self.activeQueue = allCards.shuffled()
        self.currentCard = activeQueue.first
    }
    
    // 3. Core Logic: Moving through the deck
    func submitAnswer(isCorrect: Bool) {
        guard let card = currentCard else { return }
        
        totalAttempted += 1
        if isCorrect { correctCount += 1 }
        
        // Remove the card we just answered
        activeQueue.removeFirst()
        
        if isCorrect {
            if isInfiniteMode {
                // In Infinite Mode, put the card back at the bottom
                activeQueue.append(card)
            }
            // In normal mode, we simply don't add it back (it stays removed)
        } else {
            // If wrong, we always put it back so they have to try again
            // You can decide if you want to shuffle it back in or put it at the end
            activeQueue.append(card)
        }
        
        advanceToNext()
    }
    
    private func advanceToNext() {
        if activeQueue.isEmpty {
            currentCard = nil
            sessionComplete = true
        } else {
            // To make it feel more random, we can re-shuffle
            // the remaining queue periodically if you want
            currentCard = activeQueue.first
        }
    }
    
    // 4. Future AI Hook
    func evaluateWithAI(userResponse: String) async {
        // We will plug Gemini in here later.
        // For now, we'll just simulate a delay and mark it correct.
        print("Evaluating: \(userResponse)")
        try? await Task.sleep(nanoseconds: 1 * 1_000_000_000)
        submitAnswer(isCorrect: true)
    }
}
