describe 'Linter Config', ->
  linter = null
  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage('linter').then ->
        linter = atom.packages.getActivePackage('linter').mainModule.instance

  getLinter = ->
    return {grammarScopes: ['*'], lintOnFly: false, modifiesBuffer: false, scope: 'project', lint: -> }
  getMessage = (type, filePath) ->
    return {type, text: "Some Message", filePath}
<<<<<<< HEAD
=======
  updateMessageRegistry = ->
    linter.messages.shouldUpdatePublic = true
    linter.messages.updatePublic()
    linter.messages.shouldUpdatePublic = false
>>>>>>> 8b5b0f74a991b49e7d437134e709641dc5e1943b

  describe 'ignoredMessageTypes', ->
    it 'ignores certain types of messages', ->
      linterProvider = getLinter()
      expect(linter.messages.publicMessages.length).toBe(0)
      linter.messages.set({linter: linterProvider, messages: [getMessage('Error'), getMessage('Warning')]})
<<<<<<< HEAD
      linter.messages.updatePublic()
      expect(linter.messages.publicMessages.length).toBe(2)
      atom.config.set('linter.ignoredMessageTypes', ['Error'])
      linter.messages.set({linter: linterProvider, messages: [getMessage('Error'), getMessage('Warning')]})
      linter.messages.updatePublic()
=======
      updateMessageRegistry()
      expect(linter.messages.publicMessages.length).toBe(2)
      atom.config.set('linter.ignoredMessageTypes', ['Error'])
      linter.messages.set({linter: linterProvider, messages: [getMessage('Error'), getMessage('Warning')]})
      updateMessageRegistry()
>>>>>>> 8b5b0f74a991b49e7d437134e709641dc5e1943b
      expect(linter.messages.publicMessages.length).toBe(1)

  describe 'statusIconScope', ->
    it 'only shows messages of the current scope', ->
      linterProvider = getLinter()
      expect(linter.views.bottomContainer.status.count).toBe(0)
      linter.messages.set({linter: linterProvider, messages: [getMessage('Error', '/tmp/test.coffee')]})
<<<<<<< HEAD
      linter.messages.updatePublic()
=======
      updateMessageRegistry()
>>>>>>> 8b5b0f74a991b49e7d437134e709641dc5e1943b
      expect(linter.views.bottomContainer.status.count).toBe(1)
      atom.config.set('linter.statusIconScope', 'File')
      expect(linter.views.bottomContainer.status.count).toBe(0)
      atom.config.set('linter.statusIconScope', 'Project')
      expect(linter.views.bottomContainer.status.count).toBe(1)
