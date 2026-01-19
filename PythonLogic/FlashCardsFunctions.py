#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Jan 18 14:34:28 2026

@author: trevorleimer
"""
import random

class FlashCard:
    '''Creates a class flashcard. takes data from each specific incident. Functions
    associated with standard flashcards. Functions to add data. They will originall
    init to blank information dictionary for each flashcard.'''
    
    
    def __init__(self, term = '', definition = ''):
        '''#creates the init. No term or defnition required, defaults to blank card.'''
        self._term = term
        self._definition = definition
        self._count_correct = 0
        self._count_incorrect = 0
        
    def get_term(self):
        return self._term
    
    def get_definition(self):
        return self._definition
    
    def get_count_correct(self):
        return self._count_correct
    
    def get_count_incorrect(self):
        return self._count_incorrect
    
    
    def write_term(self, term):
        '''#Overwrite to a new term'''
        self._term = str(term)
    
    
    def edit_term(self):
        '''#Edit the existing term, provides editable text to be expedited to write_term'''
        print(f'your current term is {self.get_term()}.')
        new_term = input(f'Please enter the edited term:{str(self.get_term())}')
        self._term = new_term
        print (f'you have successfully changed the term to {str(self.get_term())}')
     
       
    def write_definition(self, definition):
        '''Overwrite to new definition '''
        self._definition = definition

    def answer_correct(self):
        '''runs to increment the count of correct attempts, used for data analysis
        of learning progress'''
        self._count_correct = self._count_correct + 1
        
    def answer_incorrect(self):
        '''increments a failed attempt on the count_incorrect, again used for later
        data analysis when analyzing learning progress.'''
        self._count_incorrect = self._count_incorrect +1
    
    def reset_stats(self):
        '''resets all analytics for the specific object to init value'''
        self._count_correct = 0
        self._count_incorrect = 0
        
    def add_to_deck(self, deck_name):
        '''Adds the specific card to a named deck object'''
        


class Deck:
    
    def __init__(self, deck_name = '', cards = []):
        '''creates the deck class. Name allowed to be created immediately, or will
        be prompted to name'''
        self._deck_name = deck_name
        self._cards = cards
        if self._deck_name == '':
            self._deck_name = input('Please enter the desired name for your deck: ')
    
    def get_name(self):
        return self._deck_name
    
    def get_cards(self):
        names_list = []
        for card in self._cards:
            names_list.append(card.get_term())
        return names_list
    
    def add_single_card(self, card):
        '''adds a single card to the deck object'''
        self._cards.append(card)
        
    def add_set_of_cards(self, cards_list):
        '''adds a list of card objects to the deck'''
        self._cards = self._cards + cards_list
    def remove_card(self, card):
        self._cards.remove(card)

        

class Learning_Course:
    def __init__(self, name = '', decks= []):
        '''inits the course, this will hold a collection of deck objects'''
        self._name = name
        self._decks = decks
        if name == '':
            self._name = input('Please enter the desired name of your course: ')
    
    def get_course_name(self):
        return self._name
    
    def get_decks(self):
        deck_list = []
        for deck in self._decks:
            deck_list.append(deck.get_name())
        return deck_list
    def add_deck(self, incremental_deck):
        '''adds a deck to the decks data of course object'''
        self._decks.append(incremental_deck)
        
        
class Drill_Session:
    '''creates a drill session object class. This will be a temporary object class that 
    will run as a drill session. It will present information, regarding individual card
    statistics once the session terminates'''
    def __init__(self, session_id):
        self._session_id = session_id
        self._cards = []
        self._drill_type = int(input('Is this drill session: 1: infinite, 2: to completion, or 3: one time through?\
                                 please enter an integer 1, 2, or 3: '))
        self._collection = int(input('Are you drilling 1: a specific deck(s) or 2: an entire course? Please enter\
                                     an integer, 1 or 2:   '))
        self._active_card = self._cards[0]                            
    
    def increment_card(self):
        '''Increments to the next card, depending on the drill type'''
        if self._drill_type == 1:
            self._active_card = self._cards[self._active_card + 1]
            
            
        
        

