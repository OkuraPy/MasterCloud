/* Modernizr 2.7.1 (Custom Build) | MIT & BSD
 * Build: http://modernizr.com/download/#-csstransforms-csstransforms3d-csstransitions-teststyles-testprop-testallprops-prefixes-domprefixes
 */
;
window.Modernizr = function(a, b, c) {
    function y(a) {
        i.cssText = a
    }
    function z(a, b) {
        return y(l.join(a + ";") + (b || ""))
    }
    function A(a, b) {
        return typeof a === b
    }
    function B(a, b) {
        return!!~("" + a).indexOf(b)
    }
    function C(a, b) {
        for (var d in a) {
            var e = a[d];
            if (!B(e, "-") && i[e] !== c)
                return b == "pfx" ? e : !0
        }
        return!1
    }
    function D(a, b, d) {
        for (var e in a) {
            var f = b[a[e]];
            if (f !== c)
                return d === !1 ? a[e] : A(f, "function") ? f.bind(d || b) : f
        }
        return!1
    }
    function E(a, b, c) {
        var d = a.charAt(0).toUpperCase() + a.slice(1), e = (a + " " + n.join(d + " ") + d).split(" ");
        return A(b, "string") || A(b, "undefined") ? C(e, b) : (e = (a + " " + o.join(d + " ") + d).split(" "), D(e, b, c))
    }
    var d = "2.7.1", e = {}, f = b.documentElement, g = "modernizr", h = b.createElement(g), i = h.style, j, k = {}.toString, l = " -webkit- -moz- -o- -ms- ".split(" "), m = "Webkit Moz O ms", n = m.split(" "), o = m.toLowerCase().split(" "), p = {}, q = {}, r = {}, s = [], t = s.slice, u, v = function(a, c, d, e) {
        var h, i, j, k, l = b.createElement("div"), m = b.body, n = m || b.createElement("body");
        if (parseInt(d, 10))
            while (d--)
                j = b.createElement("div"), j.id = e ? e[d] : g + (d + 1), l.appendChild(j);
        return h = ["&#173;", '<style id="s', g, '">', a, "</style>"].join(""), l.id = g, (m ? l : n).innerHTML += h, n.appendChild(l), m || (n.style.background = "", n.style.overflow = "hidden", k = f.style.overflow, f.style.overflow = "hidden", f.appendChild(n)), i = c(l, a), m ? l.parentNode.removeChild(l) : (n.parentNode.removeChild(n), f.style.overflow = k), !!i
    }, w = {}.hasOwnProperty, x;
    !A(w, "undefined") && !A(w.call, "undefined") ? x = function(a, b) {
        return w.call(a, b)
    } : x = function(a, b) {
        return b in a && A(a.constructor.prototype[b], "undefined")
    }, Function.prototype.bind || (Function.prototype.bind = function(b) {
        var c = this;
        if (typeof c != "function")
            throw new TypeError;
        var d = t.call(arguments, 1), e = function() {
            if (this instanceof e) {
                var a = function() {
                };
                a.prototype = c.prototype;
                var f = new a, g = c.apply(f, d.concat(t.call(arguments)));
                return Object(g) === g ? g : f
            }
            return c.apply(b, d.concat(t.call(arguments)))
        };
        return e
    }), p.csstransforms = function() {
        return!!E("transform")
    }, p.csstransforms3d = function() {
        var a = !!E("perspective");
        return a && "webkitPerspective"in f.style && v("@media (transform-3d),(-webkit-transform-3d){#modernizr{left:9px;position:absolute;height:3px;}}", function(b, c) {
            a = b.offsetLeft === 9 && b.offsetHeight === 3
        }), a
    }, p.csstransitions = function() {
        return E("transition")
    };
    for (var F in p)
        x(p, F) && (u = F.toLowerCase(), e[u] = p[F](), s.push((e[u] ? "" : "no-") + u));
    return e.addTest = function(a, b) {
        if (typeof a == "object")
            for (var d in a)
                x(a, d) && e.addTest(d, a[d]);
        else {
            a = a.toLowerCase();
            if (e[a] !== c)
                return e;
            b = typeof b == "function" ? b() : b, typeof enableClasses != "undefined" && enableClasses && (f.className += " " + (b ? "" : "no-") + a), e[a] = b
        }
        return e
    }, y(""), h = j = null, e._version = d, e._prefixes = l, e._domPrefixes = o, e._cssomPrefixes = n, e.testProp = function(a) {
        return C([a])
    }, e.testAllProps = E, e.testStyles = v, e
}(this, this.document);


!function($) {

    var ProgressButton = function(element, options) {
        this.element = $(element);
        this.options = options;
        this._init();
    };

    var support = {transitions: Modernizr.csstransitions, transforms3d: Modernizr.csstransforms3d && Modernizr.csstransformspreserve3d},
    // transition end event name
    transEndEventNames = {
        'WebkitTransition': 'webkitTransitionEnd',
        'MozTransition': 'transitionend',
        'OTransition': 'oTransitionEnd',
        'msTransition': 'MSTransitionEnd',
        'transition': 'transitionend'
    };

    ProgressButton.prototype = {
        constructor: ProgressButton,
        _init: function(e) {
            this._validate();
            // create structure
            this._create();
            // init events
            this._initEvents();
        },
        _validate: function() {
            // we will consider the fill/horizontal as default
            if (!this.element.data('style')) {
                this.element.data('style', 'fill');
            }
            if (this.element.data('vertical') === undefined) {
                this.element.data('horizontal', true);
            } else
                this.element.data('vertical', true);

            if (!support.transforms3d && this.element.data('perspective') !== undefined) {
                this.element.data('perspective', false);
                this.element.data('style', 'fill');
                this.element.data('vertical', false);
                this.element.data('horizontal', true);
            } else
                this.element.data('perspective', true);
        },
        _create: function() {
            var textEl = document.createElement('span');
            textEl.className = 'content';
            textEl.innerHTML = this.element.html();
            var progressEl = document.createElement('span');
            progressEl.className = 'progress';

            var progressInnerEl = document.createElement('span');
            progressInnerEl.className = 'progress-inner';
            progressEl.appendChild(progressInnerEl);
            // clear content
            this.element.html('');

            if (this.element.data('perspective')) {
                var progressWrapEl = document.createElement('span');
                progressWrapEl.className = 'progress-wrap';
                progressWrapEl.appendChild(textEl);
                progressWrapEl.appendChild(progressEl);

                this.element.append(progressWrapEl);
            }
            else {
                this.element.append(textEl);
                this.element.append(progressEl);
            }

            // the element that serves as the progress bar
            this.progress = $(progressInnerEl);

            // property to change on the progress element
            if (this.element.data('vertical')) {
                this.progressProp = 'height';
            } else
                this.progressProp = 'width';

            this._enable();
        },
        _setProgress: function(val) {
            this.progress.css(this.progressProp, 100 * val + '%');
        },
        _initEvents: function() {
            var self = this;
            if(this.element.is('[type=submit]')){
                this.element.parents('form').submit(function(){
                    if($(this).data('Parsley') && !$(this).data('Parsley').isValid()){
                        return;
                    }
                    self._start()
                })
            }else
                this.element.click(function(){
                    self._start()
                });
        },
        _start: function(ev) {
            // disable the button
            var self = this;
            if (typeof self.options.start === 'function' && self.options.start(self) === false)
                return true;

            self.element.prop('disabled', true)
                    .addClass('state-loading');

            self.progress.removeClass('notransition')
            
            setTimeout(function() {
                if (typeof self.options.progress === 'function') {
                    self.options.progress(self);
                } else {
                    self._setProgress(1);
                    var onEndTransFn = function(ev) {
                        if (support.transitions && ev.originalEvent.propertyName !== self.progressProp)
                            return;
                        self.progress.unbind('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend');
                        self._stop();
                    };

                    if (support.transitions) {
                        self.progress.bind('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', onEndTransFn);
                    }
                    else {
                        onEndTransFn.call();
                    }
                }
            },
                    self.element.data('style') === 'fill' ||
                    self.element.data('style') === 'top-line' ||
                    self.element.data('style') === 'lateral-lines' ? 0 : 200); // TODO: change timeout to transitionend event callback
        },
        _stop: function(status) {
            var self = this;
            setTimeout(function() {
                // fade out progress bar
                self.progress.css('opacity', 0);
                var onEndTransFn = function(ev) {
                    if (support.transitions && ev.originalEvent.propertyName !== 'opacity')
                        return;
                    self.progress.unbind('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend');
                    self.progress.addClass('notransition');
                    self.progress.css(self.progressProp, '0%');
                    self.progress.css('opacity', 1);
                };

                if (support.transitions) {
                    self.progress.bind('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', onEndTransFn);
                }
                else {
                    onEndTransFn.call();
                }


                // add class state-success to the button
                if (typeof status !== 'undefined') {
                    var statusClass = status ? 'state-success' : 'state-error';
                    self.element.addClass(statusClass);
                    // after options.statusTime remove status
                    setTimeout(function() {
                        self.element.removeClass(statusClass);
                        self._enable();
                    }, self.options.statusTime);
                }
                else {
                    self._enable();
                }

                // remove class state-loading from the button
                self.element.removeClass('state-loading');
            }, 100);
        },
        _enable: function() {
            this.element.removeAttr('disabled').prop('disabled', false);
        }

    };
    $.fn.progressbutton = function(option, val) {
        return this.each(function() {
            var $this = $(this),
                    data = $this.data('progressButton'),
                    options = typeof option === 'object' && option;
            if (!data) {
                $this.data('progressButton', (data = new ProgressButton(this, $.extend({}, $.fn.progressbutton.defaults, options))));
            }
            if (typeof option === 'string')
                data[option](val);
        });
    };

    $.fn.progressbutton.defaults = {
        statusTime: 1500
    };
    $.fn.progressbutton.Constructor = ProgressButton;

}(window.jQuery);