//
//  Prompt.swift
//  mobile-cross-platform-template
//
//  Created by Harsha Kocherla on 6/14/25.
//

import Foundation

enum PromptCategory: String, Codable, CaseIterable {
    case food = "Food & Drink"
    case travel = "Travel & Adventure"
    case social = "Social & Lifestyle"
    case romance = "Romance & Intimacy"
    case entertainment = "Entertainment & Hobbies"
    case values = "Values & Deep Talk"
    
    var icon: String {
        switch self {
        case .food: return "fork.knife"
        case .travel: return "airplane"
        case .social: return "person.2"
        case .romance: return "heart"
        case .entertainment: return "tv"
        case .values: return "brain"
        }
    }
}

struct Prompt: Identifiable, Codable {
    let id: UUID
    let text: String
    let category: PromptCategory
    let isCustom: Bool
    
    init(id: UUID = UUID(), text: String, category: PromptCategory, isCustom: Bool = false) {
        self.id = id
        self.text = text
        self.category = category
        self.isCustom = isCustom
    }
}

// Sample prompts for each category
extension Prompt {
    static let samplePrompts: [Prompt] = [
        // Food & Drink
        Prompt(text: "Pineapple on pizza", category: .food),
        Prompt(text: "Sushi", category: .food),
        Prompt(text: "Coffee", category: .food),
        Prompt(text: "Spicy food", category: .food),
        
        // Travel & Adventure
        Prompt(text: "Camping", category: .travel),
        Prompt(text: "Cruise vacations", category: .travel),
        Prompt(text: "Road trips", category: .travel),
        Prompt(text: "Solo travel", category: .travel),
        
        // Social & Lifestyle
        Prompt(text: "Social media", category: .social),
        Prompt(text: "Nightclubs", category: .social),
        Prompt(text: "Small talk", category: .social),
        Prompt(text: "Group activities", category: .social),
        
        // Romance & Intimacy
        Prompt(text: "Public displays of affection", category: .romance),
        Prompt(text: "Long-distance relationships", category: .romance),
        Prompt(text: "Marriage", category: .romance),
        Prompt(text: "Dating apps", category: .romance),
        
        // Entertainment & Hobbies
        Prompt(text: "Reality TV", category: .entertainment),
        Prompt(text: "Video games", category: .entertainment),
        Prompt(text: "Reading", category: .entertainment),
        Prompt(text: "Dancing", category: .entertainment),
        
        // Values & Deep Talk
        Prompt(text: "Religion", category: .values),
        Prompt(text: "Politics", category: .values),
        Prompt(text: "Career vs. family", category: .values),
        Prompt(text: "Money management", category: .values)
    ]
}

