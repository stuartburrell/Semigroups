//
// Semigroups package for GAP
// Copyright (C) 2016 James D. Mitchell
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

/*******************************************************************************
 *******************************************************************************
 * Headers
 *******************************************************************************
 ******************************************************************************/

#include <assert.h>

#include <string>
#include <utility>

#include "src/compiled.h"

#include "converter.h"
#include "data.h"
#include "fropin.h"
#include "gap.h"
#include "interface.h"

#include "semigroupsplusplus/semigroups.h"

// Helper functions

template <typename T>
static inline void really_delete_cont(T* cont) {
  for (Element* x : *cont) {
    x->really_delete();
  }
  delete cont;
}

/*******************************************************************************
 * ConvertElements:
 ******************************************************************************/

std::vector<Element*>*
ConvertElements(Converter* converter, Obj elements, size_t degree) {
  assert(IS_LIST(elements));

  auto out = new std::vector<Element*>();

  for (size_t i = 0; i < (size_t) LEN_LIST(elements); i++) {
    out->push_back(converter->convert(ELM_LIST(elements, i + 1), degree));
  }
  return out;
}

Obj UnconvertElements(Converter* converter, std::vector<Element*>* elements) {

  if (elements->empty()) {
    Obj out = NEW_PLIST(T_PLIST_EMPTY, 0);
    SET_LEN_PLIST(out, 0);
    return out;
  }

  Obj out = NEW_PLIST(T_PLIST, elements->size());
  SET_LEN_PLIST(out, elements->size());

  for (size_t i = 0; i < elements->size(); i++) {
    SET_ELM_PLIST(out, i + 1, converter->unconvert(elements->at(i)));
    CHANGED_BAG(out);
  }
  return out;
}

/*******************************************************************************
 * ConvertFromCayleyGraph: helper function to convert a cayley_graph_t to a GAP
 * plist of GAP plists
 ******************************************************************************/

Obj ConvertFromCayleyGraph(cayley_graph_t* graph) {
  assert(graph->size() != 0);
  Obj out = NEW_PLIST(T_PLIST, graph->nr_rows());
  SET_LEN_PLIST(out, graph->nr_rows());

  for (size_t i = 0; i < graph->nr_rows(); i++) {
    Obj next = NEW_PLIST(T_PLIST_CYC, graph->nr_cols());
    SET_LEN_PLIST(next, graph->nr_cols());
    for (size_t j = 0; j < graph->nr_cols(); j++) { // TODO reinstate this
      SET_ELM_PLIST(next, j + 1, INTOBJ_INT(graph->get(i, j) + 1));
    }
    SET_ELM_PLIST(out, i + 1, next);
    CHANGED_BAG(out);
  }
  return out;
}

//
//

Obj word_t_to_plist(word_t const& word) {
  Obj out = NEW_PLIST(T_PLIST_CYC, word.size());
  SET_LEN_PLIST(out, word.size());

  for (size_t i = 0; i < word.size(); i++) {
    SET_ELM_PLIST(out, i + 1, INTOBJ_INT(word[i] + 1));
  }
  CHANGED_BAG(out);
  return out;
}

/*******************************************************************************
 *******************************************************************************
 * GAP level functions
 *******************************************************************************
 ******************************************************************************/

/*******************************************************************************
 * SEMIGROUP_ADD_GENERATORS:
 ******************************************************************************/

Obj SEMIGROUP_ADD_GENERATORS(Obj self, Obj data, Obj coll_gap) {
  if (data_type(data) == UNKNOWN) {
    ErrorQuit("SEMIGROUP_ADD_GENERATORS: this shouldn't happen!", 0L, 0L);
  }

  assert(IS_PLIST(coll_gap));
  assert(LEN_PLIST(coll_gap) > 0);

  Semigroup*                    semigroup = data_semigroup(data);
  Converter*                    converter = data_converter(data);
  std::unordered_set<Element*>* coll = new std::unordered_set<Element*>();

  for (size_t i = 1; i <= (size_t) LEN_PLIST(coll_gap); i++) {
    coll->insert(
        converter->convert(ELM_PLIST(coll_gap, i), semigroup->degree()));
  }
  semigroup->add_generators(coll, rec_get_report(data));
  really_delete_cont(coll);

  Obj gens = ElmPRec(data, RNam_gens); // TODO make this safe

  for (size_t i = 0; i < semigroup->nrgens(); i++) {
    AssPlist(gens, i + 1, converter->unconvert(semigroup->gens()->at(i)));
  }

  if (IsbPRec(data, RNam_left)) {
    UnbPRec(data, RNam_left);
  }
  if (IsbPRec(data, RNam_right)) {
    UnbPRec(data, RNam_right);
  }
  if (IsbPRec(data, RNam_rules)) {
    UnbPRec(data, RNam_rules);
  }
  if (IsbPRec(data, RNam_words)) {
    UnbPRec(data, RNam_words);
  }

  return data;
}

/*******************************************************************************
 * SEMIGROUP_CAYLEY_TABLE: TODO for non-C++
 ******************************************************************************/

Obj SEMIGROUP_CAYLEY_TABLE(Obj self, Obj data) {
  if (data_type(data) != UNKNOWN) {
    Semigroup* semigroup = data_semigroup(data);
    bool       report    = rec_get_report(data);
    Obj        out       = NEW_PLIST(T_PLIST_HOM, semigroup->size(report));
    SET_LEN_PLIST(out, semigroup->size(report));

    for (size_t i = 0; i < semigroup->size(report); i++) {
      Obj next = NEW_PLIST(T_PLIST_CYC, semigroup->size(report));
      SET_LEN_PLIST(next, semigroup->size(report));
      for (size_t j = 0; j < semigroup->size(report); j++) {
        SET_ELM_PLIST(
            next, j + 1, INTOBJ_INT(semigroup->fast_product(i, j) + 1));
      }
      SET_ELM_PLIST(out, i + 1, next);
      CHANGED_BAG(out);
    }
    return out;
  }
}

/*******************************************************************************
 * SEMIGROUP_CLOSURE:
 ******************************************************************************/

Obj SEMIGROUP_CLOSURE(Obj self, Obj old_data, Obj coll_gap, Obj degree) {

  assert(IS_LIST(coll_gap) && LEN_LIST(coll_gap) > 0);
  assert(data_type(old_data) != UNKNOWN);

  Semigroup* old_semigroup = data_semigroup(old_data);
  Converter* converter     = data_converter(old_data);

  std::vector<Element*>* coll(
      ConvertElements(converter, coll_gap, INT_INTOBJ(degree)));

  Semigroup* new_semigroup(
      new Semigroup(*old_semigroup, coll, rec_get_report(old_data)));
  new_semigroup->set_batch_size(data_batch_size(old_data));

  really_delete_cont(coll);

  Obj new_data = NEW_PREC(6);

  AssPRec(
      new_data, RNam_gens, UnconvertElements(converter, new_semigroup->gens()));
  AssPRec(new_data, RNam_degree, INTOBJ_INT(new_semigroup->degree()));
  AssPRec(new_data, RNam_report, ElmPRec(old_data, RNam_report));
  AssPRec(new_data, RNam_batch_size, ElmPRec(old_data, RNam_batch_size));

  data_init_semigroup(new_data, new_semigroup);

  return new_data;
}

/*******************************************************************************
 * SEMIGROUP_CURRENT_MAX_WORD_LENGTH:
 ******************************************************************************/

Obj SEMIGROUP_CURRENT_MAX_WORD_LENGTH(Obj self, Obj data) {
  if (data_type(data) != UNKNOWN) {
    return INTOBJ_INT(data_semigroup(data)->current_max_word_length());
  } else {
    initRNams();
    if (IsbPRec(data, RNam_words) && LEN_PLIST(ElmPRec(data, RNam_words)) > 0) {
      Obj words = ElmPRec(data, RNam_words);
      return INTOBJ_INT(LEN_PLIST(ELM_PLIST(words, LEN_PLIST(words))));
    } else {
      return INTOBJ_INT(1);
    }
  }
}

/*******************************************************************************
 * SEMIGROUP_CURRENT_NR_RULES:
 ******************************************************************************/

Obj SEMIGROUP_CURRENT_NR_RULES(Obj self, Obj data) {
  if (data_type(data) != UNKNOWN) {
    return INTOBJ_INT(data_semigroup(data)->current_nrrules());
  }
  return INTOBJ_INT(ElmPRec(data, RNamName("nrrules")));
}

/*******************************************************************************
 * SEMIGROUP_CURRENT_SIZE:
 ******************************************************************************/

Obj SEMIGROUP_CURRENT_SIZE(Obj self, Obj data) {
  if (data_type(data) != UNKNOWN) {
    return INTOBJ_INT(data_semigroup(data)->current_size());
  }

  initRNams();
  return INTOBJ_INT(LEN_PLIST(ElmPRec(data, RNam_elts)));
}

/*******************************************************************************
 * SEMIGROUP_AS_LIST: get the elements of the C++ semigroup, store them in
 * data.
 ******************************************************************************/

Obj SEMIGROUP_AS_LIST(Obj self, Obj data) {
  initRNams();

  if (data_type(data) != UNKNOWN) {
    std::vector<Element*>* elements =
        data_semigroup(data)->elements(rec_get_report(data));
    Converter* converter = data_converter(data);

    if (!IsbPRec(data, RNam_elts)) {
      Obj out = NEW_PLIST(T_PLIST, elements->size());
      SET_LEN_PLIST(out, elements->size());
      for (size_t i = 0; i < elements->size(); i++) {
        SET_ELM_PLIST(out, i + 1, converter->unconvert(elements->at(i)));
        CHANGED_BAG(out);
      }
      AssPRec(data, RNam_elts, out);
    } else {
      Obj out = ElmPRec(data, RNam_elts);
      for (size_t i = LEN_PLIST(out); i < elements->size(); i++) {
        AssPlist(out, i + 1, converter->unconvert(elements->at(i)));
      }
    }
    CHANGED_BAG(data);
  } else {
    fropin(data, INTOBJ_INT(-1), 0, False);
  }
  return ElmPRec(data, RNam_elts);
}

/*******************************************************************************
 * SEMIGROUP_ELEMENT_NUMBER: get the <pos> element of <S>, do not store them in
 * the data record.
 ******************************************************************************/

Obj SEMIGROUP_ELEMENT_NUMBER(Obj self, Obj data, Obj pos) {

  size_t nr = INT_INTOBJ(pos);

  initRNams();

  // use the element cached in the data record if known
  if (IsbPRec(data, RNam_elts)) {
    Obj elts = ElmPRec(data, RNam_elts);
    if (nr <= (size_t) LEN_PLIST(elts) && ELM_PLIST(elts, nr) != 0) {
      return ELM_PLIST(elts, nr);
    }
  }

  if (data_type(data) == UNKNOWN) {
    fropin(data, pos, 0, False);
    Obj elts = ElmPRec(data, RNam_elts);
    if (nr <= (size_t) LEN_PLIST(elts) && ELM_PLIST(elts, nr) != 0) {
      return ELM_PLIST(elts, nr);
    } else {
      return Fail;
    }
  } else {
    nr--;
    Semigroup* semigroup = data_semigroup(data);
    Element*   x         = semigroup->at(nr, rec_get_report(data));
    return (x == nullptr ? Fail : data_converter(data)->unconvert(x));
  }
}

Obj SEMIGROUP_ELEMENT_NUMBER_SORTED(Obj self, Obj data, Obj pos) {

  if (data_type(data) == UNKNOWN) {
    ErrorQuit(
        "SEMIGROUP_ELEMENT_NUMBER_SORTED: this shouldn't happen!", 0L, 0L);
    return 0L;
  } else {
    size_t     nr        = INT_INTOBJ(pos) - 1;
    Semigroup* semigroup = data_semigroup(data);
    Element*   x         = semigroup->sorted_at(nr, rec_get_report(data));
    return (x == nullptr ? Fail : data_converter(data)->unconvert(x));
  }
}

Obj SEMIGROUP_AS_SET(Obj self, Obj data) {
  // TODO make this faster by running through _pos_sorted so that we run through
  // semigroup->_elements in order, and fill in out (below) out of order
  if (data_type(data) == UNKNOWN) {
    ErrorQuit("SEMIGROUP_AS_SET: this shouldn't happen!", 0L, 0L);
    return 0L;
  }

  std::vector<std::pair<Element*, size_t>>* pairs =
      data_semigroup(data)->sorted_elements(rec_get_report(data));
  Converter* converter = data_converter(data);

  Obj out = NEW_PLIST(T_PLIST, pairs->size());
  SET_LEN_PLIST(out, pairs->size());

  size_t i = 1;
  for (auto x : *pairs) {
    SET_ELM_PLIST(out, i++, converter->unconvert(x.first));
    CHANGED_BAG(out);
  }
  return out;
}

Obj SEMIGROUP_POSITION_SORTED(Obj self, Obj data, Obj x) {

  // use the element cached in the data record if known
  if (data_type(data) == UNKNOWN) {
    ErrorQuit("SEMIGROUP_POSITION_SORTED: this shouldn't happen!", 0L, 0L);
    return 0L;
  } else {
    size_t     deg       = data_degree(data);
    Semigroup* semigroup = data_semigroup(data);
    Converter* converter = data_converter(data);
    Element* xx(converter->convert(x, deg));
    size_t     pos = semigroup->position_sorted(xx, rec_get_report(data));
    delete xx;
    return (pos == Semigroup::UNDEFINED ? Fail : INTOBJ_INT(pos + 1));
  }
}

/*******************************************************************************
 * SEMIGROUP_ENUMERATE:
 ******************************************************************************/

Obj SEMIGROUP_ENUMERATE(Obj self, Obj data, Obj limit) {
  if (data_type(data) != UNKNOWN) {
    data_semigroup(data)->enumerate(INT_INTOBJ(limit), rec_get_report(data));
  } else {
    fropin(data, limit, 0, False);
  }
  return data;
}

/*******************************************************************************
 * SEMIGROUP_FACTORIZATION:
 ******************************************************************************/

Obj SEMIGROUP_FACTORIZATION(Obj self, Obj data, Obj pos) {

  initRNams();

  if (data_type(data) != UNKNOWN) {
    size_t     pos_c = INT_INTOBJ(pos);
    Obj        words;
    Semigroup* semigroup = data_semigroup(data);
    if (!IsbPRec(data, RNam_words)) {
      word_t w;  // changed in place by the next line
      semigroup->factorisation(w, pos_c - 1, rec_get_report(data));
      words = NEW_PLIST(T_PLIST, pos_c);
      SET_LEN_PLIST(words, pos_c);
      SET_ELM_PLIST(words, pos_c, word_t_to_plist(w));
      CHANGED_BAG(words);
      AssPRec(data, RNam_words, words);
    } else {
      words = ElmPRec(data, RNam_words);
      if (pos_c > (size_t) LEN_PLIST(words) || ELM_PLIST(words, pos_c) == 0) {
        // avoid retracing the Schreier tree if possible
        size_t prefix = semigroup->prefix(pos_c - 1) + 1;
        size_t suffix = semigroup->suffix(pos_c - 1) + 1;
        if (prefix != 0 && prefix <= (size_t) LEN_PLIST(words)
            && ELM_PLIST(words, prefix) != 0) {
          Obj old_word = ELM_PLIST(words, prefix);
          Obj new_word = NEW_PLIST(T_PLIST_CYC, LEN_PLIST(old_word) + 1);
          memcpy((void*) ((char*) (ADDR_OBJ(new_word)) + sizeof(Obj)),
                 (void*) ((char*) (ADDR_OBJ(old_word)) + sizeof(Obj)),
                 (size_t)(LEN_PLIST(old_word) * sizeof(Obj)));
          SET_ELM_PLIST(new_word,
                        LEN_PLIST(old_word) + 1,
                        INTOBJ_INT(semigroup->final_letter(pos_c - 1) + 1));
          SET_LEN_PLIST(new_word, LEN_PLIST(old_word) + 1);
          AssPlist(words, pos_c, new_word);
        } else if (suffix != 0 && suffix <= (size_t) LEN_PLIST(words)
                   && ELM_PLIST(words, suffix) != 0) {
          Obj old_word = ELM_PLIST(words, suffix);
          Obj new_word = NEW_PLIST(T_PLIST_CYC, LEN_PLIST(old_word) + 1);
          memcpy((void*) ((char*) (ADDR_OBJ(new_word)) + 2 * sizeof(Obj)),
                 (void*) ((char*) (ADDR_OBJ(old_word)) + sizeof(Obj)),
                 (size_t)(LEN_PLIST(old_word) * sizeof(Obj)));
          SET_ELM_PLIST(
              new_word, 1, INTOBJ_INT(semigroup->first_letter(pos_c - 1) + 1));
          SET_LEN_PLIST(new_word, LEN_PLIST(old_word) + 1);
          AssPlist(words, pos_c, new_word);
        } else {
          word_t w;  // changed in place by the next line
          semigroup->factorisation(w, pos_c - 1, rec_get_report(data));
          AssPlist(words, pos_c, word_t_to_plist(w));
        }
      }
    }
    CHANGED_BAG(data);
    assert(IsbPRec(data, RNam_words));
    assert(IS_PLIST(ElmPRec(data, RNam_words)));
    assert(pos_c <= (size_t) LEN_PLIST(ElmPRec(data, RNam_words)));
    return ELM_PLIST(ElmPRec(data, RNam_words), pos_c);
  } else {
    fropin(data, INTOBJ_INT(pos), 0, False);
    return ELM_PLIST(ElmPRec(data, RNam_words), INT_INTOBJ(pos));
  }
}

/*******************************************************************************
 * SEMIGROUP_IS_DONE:
 ******************************************************************************/

Obj SEMIGROUP_IS_DONE(Obj self, Obj data) {
  if (data_type(data) != UNKNOWN) {
    return (data_semigroup(data)->is_done() ? True : False);
  }

  size_t pos = INT_INTOBJ(ElmPRec(data, RNamName("pos")));
  size_t nr  = INT_INTOBJ(ElmPRec(data, RNamName("nr")));
  return (pos > nr ? True : False);
}

/*******************************************************************************
 * SEMIGROUP_LEFT_CAYLEY_GRAPH:
 ******************************************************************************/

Obj SEMIGROUP_LEFT_CAYLEY_GRAPH(Obj self, Obj data) {
  initRNams();
  if (data_type(data) != UNKNOWN) {
    if (!IsbPRec(data, RNam_left)) {
      Semigroup* semigroup = data_semigroup(data);
      AssPRec(data,
              RNam_left,
              ConvertFromCayleyGraph(
                  semigroup->left_cayley_graph(rec_get_report(data))));
      CHANGED_BAG(data);
    }
  } else {
    fropin(data, INTOBJ_INT(-1), 0, False);
  }
  return ElmPRec(data, RNam_left);
}

/*******************************************************************************
 * SEMIGROUP_LENGTH_ELEMENT:
 ******************************************************************************/

Obj SEMIGROUP_LENGTH_ELEMENT(Obj self, Obj data, Obj pos) {
  if (data_type(data) != UNKNOWN) {
    return INTOBJ_INT(data_semigroup(data)->length_non_const(
        INT_INTOBJ(pos) - 1, rec_get_report(data)));
  } else {
    // TODO
  }
}

Obj SEMIGROUP_NEXT_ITERATOR(Obj self, Obj iter) {
  initRNams();
  Obj pos = INTOBJ_INT(INT_INTOBJ(ElmPRec(iter, RNam_pos)) + 1);
  AssPRec(iter, RNam_pos, pos);
  return SEMIGROUP_ELEMENT_NUMBER(self, ElmPRec(iter, RNam_data), pos);
}

Obj SEMIGROUP_NEXT_ITERATOR_SORTED(Obj self, Obj iter) {
  initRNams();
  Obj pos = INTOBJ_INT(INT_INTOBJ(ElmPRec(iter, RNam_pos)) + 1);
  AssPRec(iter, RNam_pos, pos);
  return SEMIGROUP_ELEMENT_NUMBER_SORTED(self, ElmPRec(iter, RNam_data), pos);
}

Obj SEMIGROUP_IS_DONE_ITERATOR_CC(Obj self, Obj iter) {
  initRNams();
  Obj data = ElmPRec(iter, RNam_data);
  Int size = data_semigroup(data)->size(rec_get_report(data));
  return (INT_INTOBJ(ElmPRec(iter, RNam_pos)) == size ? True : False);
}

Obj SEMIGROUP_IS_DONE_ITERATOR(Obj self, Obj iter) {
  initRNams();
  Int size = INT_INTOBJ(SEMIGROUP_SIZE(self, ElmPRec(iter, RNam_data)));
  return (INT_INTOBJ(ElmPRec(iter, RNam_pos)) == size ? True : False);
}

/*******************************************************************************
 * SEMIGROUP_NR_IDEMPOTENTS:
 ******************************************************************************/

Obj SEMIGROUP_NR_IDEMPOTENTS(Obj self, Obj data) {
  if (data_type(data) == UNKNOWN) {
    ErrorQuit("SEMIGROUP_NR_IDEMPOTENTS: this shouldn't happen!", 0L, 0L);
  }
  return INTOBJ_INT(data_semigroup(data)->nr_idempotents(
      rec_get_report(data), rec_get_nr_threads(data)));
}

/*******************************************************************************
 * SEMIGROUP_POSITION:
 ******************************************************************************/

Obj SEMIGROUP_POSITION(Obj self, Obj data, Obj x) {

  if (data_type(data) != UNKNOWN) {
    size_t     deg       = data_degree(data);
    Semigroup* semigroup = data_semigroup(data);
    Converter* converter = data_converter(data);
    Element* xx(converter->convert(x, deg));
    size_t     pos = semigroup->position(xx, rec_get_report(data));
    delete xx;
    return (pos == Semigroup::UNDEFINED ? Fail : INTOBJ_INT(pos + 1));
  }

  Obj    ht = ElmPRec(data, RNamName("ht"));
  size_t pos, nr;

  do {
    Obj val = CALL_2ARGS(HTValue, ht, x);
    if (val != Fail) {
      return val;
    }
    Obj limit = SumInt(ElmPRec(data, RNamName("nr")), INTOBJ_INT(1));
    fropin(data, limit, 0, False);
    pos = INT_INTOBJ(ElmPRec(data, RNamName("pos")));
    nr  = INT_INTOBJ(ElmPRec(data, RNamName("nr")));
  } while (pos <= nr);
  return CALL_2ARGS(HTValue, ht, x);
}

/*******************************************************************************
 * SEMIGROUP_POSITION_CURRENT: get the position of <x> with out any further
 * enumeration
 ******************************************************************************/

Obj SEMIGROUP_POSITION_CURRENT(Obj self, Obj data, Obj x) {

  if (data_type(data) != UNKNOWN) {
    size_t     deg       = data_degree(data);
    Semigroup* semigroup = data_semigroup(data);
    Converter* converter = data_converter(data);
    Element*   xx(converter->convert(x, deg));
    size_t     pos = semigroup->position_current(xx);
    delete xx;
    return (pos == Semigroup::UNDEFINED ? Fail : INTOBJ_INT(pos + 1));
  }

  return CALL_2ARGS(HTValue, ElmPRec(data, RNamName("ht")), x);
}

//

Obj SEMIGROUP_RELATIONS(Obj self, Obj data) {
  initRNams();
  if (data_type(data) != UNKNOWN) {
    if (!IsbPRec(data, RNam_rules)) {
      Semigroup* semigroup = data_semigroup(data);
      bool       report    = rec_get_report(data);

      Obj rules = NEW_PLIST(T_PLIST, semigroup->nrrules(report));
      SET_LEN_PLIST(rules, semigroup->nrrules(report));
      size_t nr = 0;

      semigroup->reset_next_relation();
      std::vector<size_t> relation;
      semigroup->next_relation(relation, report);

      while (relation.size() == 2) {
        Obj next = NEW_PLIST(T_PLIST, 2);
        SET_LEN_PLIST(next, 2);
        for (size_t i = 0; i < 2; i++) {
          Obj w = NEW_PLIST(T_PLIST_CYC, 1);
          SET_LEN_PLIST(w, 1);
          SET_ELM_PLIST(w, 1, INTOBJ_INT(relation.at(i) + 1));
          SET_ELM_PLIST(next, i + 1, w);
          CHANGED_BAG(next);
        }
        nr++;
        SET_ELM_PLIST(rules, nr, next);
        CHANGED_BAG(rules);
        semigroup->next_relation(relation, report);
      }

      while (!relation.empty()) {

        Obj old_word =
            SEMIGROUP_FACTORIZATION(self, data, INTOBJ_INT(relation.at(0) + 1));
        Obj new_word = NEW_PLIST(T_PLIST_CYC, LEN_PLIST(old_word) + 1);
        memcpy((void*) ((char*) (ADDR_OBJ(new_word)) + sizeof(Obj)),
               (void*) ((char*) (ADDR_OBJ(old_word)) + sizeof(Obj)),
               (size_t)(LEN_PLIST(old_word) * sizeof(Obj)));
        SET_ELM_PLIST(
            new_word, LEN_PLIST(old_word) + 1, INTOBJ_INT(relation.at(1) + 1));
        SET_LEN_PLIST(new_word, LEN_PLIST(old_word) + 1);

        Obj next = NEW_PLIST(T_PLIST, 2);
        SET_LEN_PLIST(next, 2);
        SET_ELM_PLIST(next, 1, new_word);
        CHANGED_BAG(next);
        SET_ELM_PLIST(next,
                      2,
                      SEMIGROUP_FACTORIZATION(
                          self, data, INTOBJ_INT(relation.at(2) + 1)));
        CHANGED_BAG(next);
        nr++;
        SET_ELM_PLIST(rules, nr, next);
        CHANGED_BAG(rules);
        semigroup->next_relation(relation, report);
      }
      AssPRec(data, RNam_rules, rules);
      CHANGED_BAG(data);
    }
  } else {
    fropin(data, INTOBJ_INT(-1), 0, False);
  }
  return ElmPRec(data, RNam_rules);
}
/*******************************************************************************
 * SEMIGROUP_RIGHT_CAYLEY_GRAPH:
 ******************************************************************************/

Obj SEMIGROUP_RIGHT_CAYLEY_GRAPH(Obj self, Obj data) {
  initRNams();
  if (data_type(data) != UNKNOWN) {
    if (!IsbPRec(data, RNam_right)) {
      Semigroup* semigroup = data_semigroup(data);
      AssPRec(data,
              RNam_right,
              ConvertFromCayleyGraph(
                  semigroup->right_cayley_graph(rec_get_report(data))));
      CHANGED_BAG(data);
    }
  } else {
    fropin(data, INTOBJ_INT(-1), 0, False);
  }
  return ElmPRec(data, RNam_right);
}

/*******************************************************************************
 * SEMIGROUP_SIZE:
 ******************************************************************************/

Obj SEMIGROUP_SIZE(Obj self, Obj data) {
  initRNams();
  if (data_type(data) != UNKNOWN) {
    bool report = rec_get_report(data);
    return INTOBJ_INT(data_semigroup(data)->size(report));
  } else {
    fropin(data, INTOBJ_INT(-1), 0, False);
    return INTOBJ_INT(LEN_PLIST(ElmPRec(data, RNam_elts)));
  }
}
